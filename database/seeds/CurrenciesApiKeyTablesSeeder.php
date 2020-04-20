<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;
use App\CurrencyApiKey;

class CurrenciesApiKeyTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	CurrencyApiKey::create(['website' => 'fixer.io', 'api_key' => '8ae7671a42590a94bd92491d90c138e2']);
    	CurrencyApiKey::create(['website' => 'amdoren.com', 'api_key' => 'Aq9g5mCabHziDdjEyMRciGdtq5qNpf']);
    }
}
