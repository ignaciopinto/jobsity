<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SignInTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function SignTest()
    {
        $post = ['sign_currency' => 'CLP', 'sign_balance' => '100', 'sign_username' => 'user', 'sign_email' => 'lala@lala.lala', 'sign_password' => '1234' ];
        $response = $this->withHeaders([
            'X-Header' => 'Value',
        ])->json('POST', '/mainchat/signin', ['sign_currency' => 'CLP', 'sign_balance' => '100', 'sign_username' => 'user', 'sign_email' => 'lala@lala.lala', 'sign_password' => '1234' ]);
        $response->assertStatus(201)->assertJson(['created' => true]);
    }
}
