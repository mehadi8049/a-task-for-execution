<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\KeyValue;
use Validator;

class KeyValueController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $keyValues=KeyValue::all();
            if($keyValues->count()>0){
                return Response([
                    'status'=>true,
                    'message'=> 'keyValues succesfully retrieved.',
                    'data' => [
                        'keyValues'=>$keyValues
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
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'key' => 'required|string|unique:key_values,key,except,id',
            'value' => 'required|integer',
        ]);
        try {
            if($validator->fails()){
                throw new \Exception($validator->errors(),422);
            }
            $keyValue=KeyValue::create([
                'key'=>strtoupper($request->key),
                'value'=>$request->value
            ]);
            if($keyValue){
                return Response([
                    'status'=>true,
                    'message'=> 'Key and Value is stored.',
                    'data' => [
                        'keyValue'=>$keyValue
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
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
