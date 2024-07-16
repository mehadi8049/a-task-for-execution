<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\KeyValue;

class KeyValueSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $keyValues=['B3'=>4000,'B4'=>2000,'B5'=>2000,'G3'=>10000,'G4'=>5000,'G5'=>5000,'S3'=>6000,'S4'=>3000,'S5'=>3000];
        
        foreach($keyValues as $key=>$keyValue){
            KeyValue::create(['key'=>$key,'value'=>$keyValue]);
        }

    }
}
