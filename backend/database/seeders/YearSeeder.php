<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Year;

class YearSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $years = [
                    '২০০৬-২০০৭',
                    '২০০৭-২০০৮',
                    '২০০৮-২০০৯',
                    '২০০৯-২০১০',
                    '২০১০-২০১১',
                    '২০১১-২০১২',
                    '২০১২-২০১৩',
                    '২০১৩-২০১৪',
                    '২০১৪-২০১৫',
                    '২০১৫-২০১৬',
                    '২০১৬-২০১৭',
                    '২০১৭-২০১৮',
                    '২০১৮-২০১৯',
                    '২০১৯-২০২০',
                    '২০২০-২০২১',
                    '২০২১-২০২২',
                    '২০২২-২০২৩',
                    '২০২৩-২০২৪'
                ];
        foreach ($years as $year) {
            Year::create(['year' => $year]);
        }
    }
}
