<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\System\Admin;
use App\Models\UniContact;
use App\Models\UniCampaign;
use App\Models\UniCatCampaign;
use App\Models\UniGroupUser;
use App\Models\AdminCampaign;
use App\Models\Sessions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Supplier\Supplier;
use Modules\Admin\Http\Requests\AdminAccountRequest;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Validator;
use Session;
use Carbon\Carbon;
use Illuminate\Session\Store;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends BaseController
{

    public function signin(Request $request)
    {
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $authUser = Auth::user();
            $success['token'] =  $authUser->createToken('MyAuthApp')->plainTextToken;
            $success['name'] =  $authUser->name;

            return $this->sendResponse($success, 'User signed in');
        } else {
            return $this->sendError('Unauthorised.', ['error' => 'Unauthorised']);
        }
    }
    /**
     * return error response.
     * @param user_id id tài khoản aadigital
     * @param email email đăng nhập
     * @param name Tên cá nhân
     * @param remember_token token
     * @param phone số điện thoại
     * @param password mật khẩu đăng nhập
     * @param status trạng thái tài khoản
     * @param purchase_id id gói dịch vụ đăng ký
     * @param pur_campaign số lượng chiến dịch tối đa trong dịch vụ
     * @param pur_user số lượng user tối đa trong chiến dịch
     * @param set_date Cài đặt ngày
     * @return \Illuminate\Http\Response $token
     */
    public function register(Request $request)
    {
        $data['user_id'] = $request->user_id;
        $data['name'] = $request->name;
        $data['remember_token'] = $request->remember_token;
        $data['email'] = $request->email;
        $data['password'] = $request->password;
        $data['phone'] = $request->phone;
        $data['status'] = 0;
        $data['purchase_id'] = 0;
        $data['pur_campaign'] = 0;
        $data['pur_user'] = 0;
        $data['set_date'] = 3;
        $data['code_verication']  = Str::random(40);
        $users = Supplier::where('user_id', $request->user_id)->first();
        if ($users) {
            return $this->sendResponse('errors', 'Tài khoản đã tồn tại.');
        } else {
            $userId = Supplier::create($data);
            if($userId){
                $message = 'Tạo tài khoản thành công';
                $status = 200;
            } else {
                $message = 'Tạo tài khoản thất bại';
                $status = 500;
            }
            return $this->sendResponse($status, $message);
        }
    }
    /**
     * return error response.
     * @param user_id id tài khoản aadigital
     * @param email email đăng nhập
     * @param name Tên cá nhân
     * @param remember_token token
     * @param phone số điện thoại
     * @param password mật khẩu đăng nhập
     * @param status trạng thái tài khoản
     * @param purchase_id id gói dịch vụ đăng ký
     * @param pur_campaign số lượng chiến dịch tối đa trong dịch vụ
     * @param pur_user số lượng user tối đa trong chiến dịch
     * @param set_date Cài đặt ngày
     * @return \Illuminate\Http\Response $token
     */
    public function updateStatus(Request $request)
    {
        $data['user_id'] = $request->user_id;
        $data['remember_token'] = $request->remember_token;
        $data['email'] = $request->email;
        $param['status'] = 1;
        // $data['code_verication']  = Str::random(40);
        $users = Supplier::where('user_id', $request->user_id)->first();
        if (isset($users)) {
            if ($users['remember_token'] == $request->remember_token && $users['email'] == $request->email) {
                $users->fill($param)->save();
            }
        }
        
    }
    public function checkPageLy(Request $request)
    {
        // $data = $request->all();
        // $data_post = explode("-", json_encode($data));
        $ip_client = $request->ip();
        $page_ly = $request->page_ly;

        // $abcccc = $data['ip_client'];
        $check = AdminCampaign::where('page_ly', $page_ly)->pluck('campaign_id')->first();
        $check_data = UniCampaign::where('id', $check)->first();
        $check_date = strtotime($check_data->finish_date) - strtotime("now");
        $check_status = $check_data->status;
        $check_data = AdminCampaign::where('page_ly', $page_ly)->first();
        $user_id = $ip_client . '&' . Carbon::now()->toDateString();
        $d_session = [
            'user_id' => $user_id,
            'ip_address' => $ip_client,
            'user_agent' => 'PostmanRuntime/7.28.4'
        ];
        $check_session = Sessions::where('user_id', $user_id)->pluck('id')->first();
        if ($check_session == NULL && $check && $check_status == 1 && $check_date > 0) {
            $id_session = Sessions::create($d_session);
            $total_count = (int)$check_data->pagely_view;

            $param = [
                'pagely_view' => $total_count + 1,
            ];
            if ($id_session != null) {
                $check_data->fill($param)->save();
            }
            $url_link = UniCampaign::where('id', $check)->pluck('content')->first();
            return response()->json($url_link);
        } else {
            $url_link = UniCampaign::where('id', $check)->pluck('content')->first();
            // dd($url_link);
            return response()->json($url_link);
            // return $this->sendResponse($url_link, 'User signed in');
        }
    }

    public function page_view(Request $request)
    {
        $asmid = $request->input('asmid');
        $content_url = $request->input('content_url');
        $shortlink = AdminCampaign::where('page_ly', $asmid)->first();
        $campaign_id = $shortlink->campaign_id;
        $url_link = UniCampaign::where('id', $campaign_id)->pluck('content')->first();
        if ($shortlink && $url_link == $content_url) {
            $data['page_view'] = $shortlink->page_view + 1;
            $shortlink->fill($data)->save();
            $message = 'Success true';
        } else {
            $message = 'Success false';
        }
        return response()->json([
            'message' => $message,
            'asmid' => $asmid
        ]);
    }
    /**
     * return error response.
     * @param email email đăng nhập
     * @param _token token: so sánh đăng ký
     * @param purchase_id id gói dịch vụ đăng ký
     * @param pur_campaign số lượng chiến dịch tối đa trong dịch vụ
     * @param pur_user số lượng user tối đa trong chiến dịch
     * @return \Illuminate\Http\Response $token
     */
    public function updatePurchase(Request $request)
    {
        $users = Supplier::where('user_id', $request->user_id)->first();
        if (isset($users)) {
            if ($users['remember_token'] == $request->_token && $users['email'] == $request->email) {
                $data['purchase_id'] = $request->purchase_id;
                $data['pur_campaign'] = $request->pur_campaign;
                $data['pur_user'] = $request->pur_user;
                $users->fill($data)->save();
                $token_aff =  $users->createToken('MyApp')->plainTextToken;
                return $this->sendResponse($token_aff, 'Success !!!');
            } else {
                return $this->sendResponse('error', 'User not exits');
            }
        }
    }
    /**
     * return error response.
     * @param email email đăng nhập
     * @param _token token: so sánh đăng ký
     * @param user_id id user
     * @return \Illuminate\Http\Response $data
     */
    public function getDataUser(Request $request)
    {
        if ($request->user_id) {
            $users = Supplier::where('user_id', $request->user_id)->first();
            if (isset($users)) {
                if ($users['remember_token'] == $request->_token && $users['email'] == $request->email) {
                    $data['total_campaign'] = Supplier::where('user_id', $request->user_id)->pluck('pur_campaign')->first();
                    $data['total_campaign_act'] = UniCampaign::where('status', 1)->where('supplier_id', $request->user_id)->count();
                    $data['total_campaign_notact'] = UniCampaign::where('status', 0)->where('supplier_id', $request->user_id)->count();
                    $data['total_user'] = User::where('supplier_id', $request->user_id)->count();
                    $data['data_groupuser'] = UniGroupUser::where('supplier_id', $request->user_id)->get();
                    $data['data_campaign'] = UniCampaign::where('status', 1)->where('supplier_id', $request->user_id)->get();
                    $data['_token'] =  $users->createToken('MyApp')->plainTextToken;
                    return $this->sendResponse($data, 'Data success');
                } else {
                    return $this->sendResponse('error', 'User not exits');
                }
            }
        }
    }
}
