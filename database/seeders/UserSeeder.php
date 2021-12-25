<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class UsersSeeder extends Seeder
{
    public function run()
    {
        DB::table('users')->insert(['name' => 'adsmo',             'email' => 'tlead01@gmail.com',             'password' => Hash::make('123456'),             'current_workspace_id' => '123456789',]);
    }
}
