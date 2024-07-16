<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Year;
use Illuminate\Validation\Rule;
use Validator;
use App\Rules\YearRange;

class SetYearController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $years=Year::select('id','year')->orderby('id','desc')->get();
            if($years->count()>0){
                return Response([
                    'status'=>true,
                    'message'=> 'Years succesfully retrieved.',
                    'data' => [
                        'years'=>$years
                    ]
                ],200);
            }else{
                throw new \Exception('No code found.',404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => json_decode($e->getMessage()),
                'data' => [],
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'year' => [
                'required',
                "string",
                Rule::unique('years'),
                new YearRange()
            ],
        ]);
        try {
            if($validator->fails()){
                throw new \Exception($validator->errors(),422);
            }
            $year=Year::create([
                'year'=>$request->year
            ]);
            if($year){
                return Response([
                    'status'=>true,
                    'message'=> 'Year is created.',
                    'data' => [
                        'year'=>$year
                    ]
                ],201);
            }else{
                throw new \Exception('Something is wrong',500);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => json_decode($e->getMessage()),
                'data' => [],
            ],$e->getCode());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
