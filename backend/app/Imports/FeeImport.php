<?php

namespace App\Imports;

use App\Models\Fee;
use Maatwebsite\Excel\Concerns\ToModel;

class FeeImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        // return new Fee([
        //     //
        // ]);
    }
}
