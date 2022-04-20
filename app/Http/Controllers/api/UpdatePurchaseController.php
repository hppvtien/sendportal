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
use App\Models\WorkspaceUser;
use App\Models\User;
use Carbon\Carbon;
use App\Rules\ValidInvitation;
use App\Services\Workspaces\AcceptInvitation;
use App\Services\Workspaces\CreateWorkspace;
use App\Traits\ChecksInvitations;

class UpdatePurchaseController extends Controller
{
    protected $createWorkspace;
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
        // $abc = 111;
        // return $abc;
        $data['purchase_id'] = $request->purchase_id;
        $data['mail_limit_day'] = $request->mail_limit_day;
        $data['mail_limit_month'] = $request->mail_limit_month;
        $data['size_limit_mail'] = $request->size_limit_mail;
        $data['user_limit_use'] = $request->user_limit_use;
        $data['template_limit_use'] = $request->template_limit_use;
        $data['remember_token'] = $request->_token;
        $data['adigital_id'] =  $request->adigital_id;
        $data['email'] =  $request->email;
        $users = User::where('adigital_id', $data['adigital_id'])->where('remember_token', $request->_token)->first();
        if (isset($users)) {
            $data['finished_at'] = date('Y-m-d H:i:s', strtotime(Carbon::now() . ' + 30 days'));
            // return $data;
            $users->fill($data)->save();
            return response([
                'message' => __('Update đơn hàng thành công !!!')
            ], 200);
            // $token_aff =  $users->createToken('MyApp')->plainTextToken;
            // return $this->sendResponse($token_aff, 'Update đơn hàng thành công !!!');
        } else {
            $data['password'] = $request->password;
            // $data['phone'] = $request->phone;
            $data['name'] = $request->name;
            $data['locale'] = 'en';
            $data['finished_at'] = date('Y-m-d H:i:s', strtotime(Carbon::now() . ' + 30 days'));
            $data['updated_at'] = Carbon::now();
            $data['email_verified_at'] = Carbon::now();
            // $data['status'] = 1;
            $data['current_workspace_id'] = 1;
            $userId = User::create($data)->id;
            if ($userId) {
                $param = [
                    'name' => $request->name,
                    'owner_id' => $userId,
                ];
                $workspaceId = Workspace::create($param)->id;
                if ($workspaceId) {
                    $param_wpu = [
                        'workspace_id' => $workspaceId,
                        'user_id' => $userId,
                        'role' => 'owner',
                    ];
                    WorkspaceUser::create($param_wpu);
                }
                $current_workspace_id['current_workspace_id'] = $workspaceId;
                $user_data = User::find($userId);
                $user_data->fill($current_workspace_id)->save();
                return response([
                    'message' => __('Tài khoản đã được thêm mới')
                ], 200);
                // return $this->sendResponse('success', 'Tài khoản đã được thêm mới');
            } else {
                return response([
                    'message' => __('Thông tin chưa chính xác, vui lòng kiểm tra lại')
                ], 401);
                // return $this->sendResponse('error', 'Thông tin chưa chính xác, vui lòng kiểm tra lại');
            }
        }
    }
}
