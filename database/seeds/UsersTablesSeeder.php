<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use App\User;

class UsersTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	User::create([
    		'name'    => 'Ignacio Pinto',
    		'email'    => 'ignacio.pinto.e@gmail.com',
    		'password'   =>  Hash::make('password'),
    		'remember_token' =>  '1234567890',
    	]);
    }
}
