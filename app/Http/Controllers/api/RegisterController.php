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
        $data['remember_token'] = $request->remember_token;
        $data['email'] = $request->email;
        $data['password'] = $request->password;
        $param['company_name'] = $request->phone;
        // $data['code_verication']  = Str::random(40);
        return $data;
        $users = User::where('user_id', $request->user_id)->first();
        if ($users) {
            return $this->sendResponse('errors', 'Tài khoản đã tồn tại.');
        } else {
            $userId = User::create($data);
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

   
}
