<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Code;
use Validator;

class SetCodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $codes=Code::select('id','code')->get();
            if($codes->count()>0){
                return Response([
                    'status'=>true,
                    'message'=> 'Codes succesfully retrieved.',
                    'data' => [
                        'codes'=>$codes
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
            'code' => 'required|string|unique:codes,code,except,id',
        ]);
        try {
            if($validator->fails()){
                throw new \Exception($validator->errors(),422);
            }
            $code=Code::create([
                'code'=>$request->code
            ]);
            if($code){
                return Response([
                    'status'=>true,
                    'message'=> 'Code is created.',
                    'data' => [
                        'code'=>$code
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
