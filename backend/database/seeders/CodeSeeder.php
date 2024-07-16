<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Code;

class CodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $codes = ['১০১', '১০২', '১০৩'];
        foreach ($codes as $code) {
            Code::create(['code' => $code]);
        }
    }
}
