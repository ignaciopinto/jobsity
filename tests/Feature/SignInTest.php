<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Tests\TestCase;

class SignInTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testSignin()
    {

        $post = ['sign_currency' => 'CLP', 'sign_balance' => '100', 'sign_username' => 'user', 'sign_email' => 'lala@lala.lol', 'sign_password' => '1234' ];
        $response = $this->withHeaders([
            'X-Header' => 'Value',
        ])->json('POST', '/mainchat/signin', $post);
        $response->assertStatus();
    }

}
