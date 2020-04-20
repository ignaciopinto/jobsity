<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Http\Controllers;
use App\Http\Controllers\ChatController;

class CurrencyExchangeTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function testExchange()
    {
        $chat = new ChatController;
        $res = $chat->currency_exchange('CLP','CLP','100',1);

        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
