<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $currency = $request->get('sign_currency');
        $balance = $request->get('sign_balance');
        $username = $request->get('sign_username');
        $email = $request->get('sign_email');
        $password = $request->get('sign_password');

        $user = new User;
        $user->name = $username;
        $user->email = $email;
        $user->default_currency = $currency;
        $user->balance = $balance;
        $user->password = Hash::make($password);
        $user->save();
        return $user->id;
    }
}
