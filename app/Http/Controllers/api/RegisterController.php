<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use Illuminate\Contracts\Validation\Validator as ValidatorContract;
// use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Workspace;
use App\Models\User;
use Carbon\Carbon;
use App\Rules\ValidInvitation;
use App\Services\Workspaces\AcceptInvitation;
use App\Services\Workspaces\CreateWorkspace;
use App\Traits\ChecksInvitations;

class RegisterController extends Controller
{
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
        $data['api_token'] = $request->remember_token;
        $data['email'] = $request->email;
        $data['password'] = $request->password;
        $data['current_workspace_id'] = 100;
        // $data['code_verication']  = Str::random(40);
        $data['email_verified_at']  = Carbon::now();
       
        $users = User::where('user_id', $request->user_id)->first();
        // return User::get();
        if ($users) {
            return $this->sendResponse('errors', 'Tài khoản đã tồn tại.');
        } else {
            $userId = User::insertGetId($data);
            if($userId){
                $param['current_workspace_id']=$userId;
                $update_wp = User::where('id', $userId)->first();
                $update_wp->fill($param)->save();
                $message = 'Tạo tài khoản thành công';
                $status = 200;
            } else {
                $message = 'Tạo tài khoản thất bại';
                $status = 500;
            }
            return $userId;
            return $this->sendResponse($status, $message);
        }
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
        $data['purchase_id'] = $request->purchase_id;
        $data['pur_campaign'] = $request->pur_campaign;
        $data['pur_user'] = $request->pur_user;
        $data['remember_token'] = $request->_token;
        $data['email'] = $request->email;
        $data['adigital_id'] =  $request->adigital_id;
        $users = Supplier::where('adigital_id', $data['adigital_id'])->where('remember_token', $request->_token)->first();

        if (isset($users)) {
            $data['finished_at'] = date('Y-m-d H:i:s', strtotime(Carbon::now() . ' + 30 days'));
            // return $data;
            $users->fill($data)->save();
            $token_aff =  $users->createToken('MyApp')->plainTextToken;
            return $this->sendResponse($token_aff, 'Update đơn hàng thành công !!!');
        } else {
            $data['password'] = $request->password;
            $data['phone'] = $request->phone;
            $data['status'] = 1;
            $data['finished_at'] = Carbon::now();
            $data['updated_at'] = Carbon::now();
            $data['status'] = 1;
            $userId = Supplier::create($data)->id;
            if ($userId) {
                $newusers = Supplier::where('id', $userId)->first();
                $token_aff =  $newusers->createToken('MyApp')->plainTextToken;
                return $this->sendResponse($token_aff, 'Tài khoản đã được thêm mới');
            } else {
                return $this->sendResponse('error', 'Thông tin chưa chính xác, vui lòng kiểm tra lại');
            }
        }
    }

   
}
