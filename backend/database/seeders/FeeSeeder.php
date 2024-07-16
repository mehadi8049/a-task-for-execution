<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Code;
use App\Models\Year;
use App\Models\Fee;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Log;
use App\Imports\FeeImport;

class FeeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {  
        $files = Excel::toArray(new \App\Imports\FeeImport, base_path('database/documents/Book1.xlsx'))[0];
        unset($files[0]);
        $pattern = '/^\d{4}-\d{4}$/u';
        $yesrs = preg_grep($pattern, $files[1]);
        // Value to be removed
        $valueToRemove = '২০২৪-২০২৫';
        // Filter the array using array_filter
        $yesrs = array_filter($yesrs, function($value) use ($valueToRemove) {
            return $value !== $valueToRemove;
        });
        unset($files[1]);
        $yearsAndFormulas = $this->yearsAndFormulas($files,$yesrs);
        
         foreach ($yearsAndFormulas as $key=>$yearAndFormula) {
            $code=Code::select('id')->where('code', en2bn($key))->first();
            foreach($yearAndFormula as $year=>$formula){
                $year=Year::select('id')->where('year', en2bn($year))->first();
                Fee::create([
                    'code_id' => $code->id,
                    'year_id' => $year->id,
                    'formula' => $formula,
                ]);
            }
            
        }

    }

    protected function yearsAndFormulas($array,$key_array) {
        $result = [];
        foreach ($array as $subArray) {
            $strings = array_filter($subArray, 'is_string');
            $result[$subArray[0]]= array_combine($key_array,$strings);
        }
        return $result;
    }
    
    
}
