<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Fee;
use App\Models\KeyValue;
use Validator;

class FeesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $fees=Fee::with('fcode','fyear')->get();
            if($fees->count()>0){
                return Response([
                    'status'=>true,
                    'message'=> 'Years succesfully retrieved.',
                    'data' => [
                        'fees'=>$fees
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
    public function fee_by_year_code(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code_id' => 'required|integer',
            'year_id' => 'required|integer'
        ]);

        try {
            if($validator->fails()){
                throw new \Exception($validator->errors(),422);
            }
            $fee=Fee::select('formula')->where(['code_id'=>$request->code_id,'year_id'=>$request->year_id])->first();
            // Regular expression to split by '+' and '*'
            $pattern = "/([+\*])/";
            $input=mb_substr($fee->formula,1);
            // Use preg_split to split the input string
            $formula = preg_split($pattern, $input, -1, PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY);
            
            $amount=[];
            foreach($formula as $value){
                if(is_string($value) && !$this->isArithmeticOperator($value) && !is_numeric($value)){
                   
                    $keyValue=KeyValue::where('key',$value)->first();
                    $amount[]=$keyValue->value;
                }else if($this->isArithmeticOperator($value) && !is_numeric($value)){
                    $amount[]=$value;
                }else{
                    $amount[]=$value;
                }
            }
            $result = implode(" ", $amount);   
            // Evaluate the expression string
            $fee = eval("return $result;");
            if($result){
                return Response([
                    'status'=>true,
                    'message'=> 'Fee is submited.',
                    'data' => [
                        'fee'=>['fee'=>round($fee)]
                    ]
                ],206);
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


    protected function isArithmeticOperator($char) {
        $operators = ['+', '-', '*', '/', '%'];
        return in_array($char, $operators);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'code_id' => 'required|integer',
            'year_id' => 'required|integer',
            'formula' => 'required|string'
        ]);
        
        try {
            if($validator->fails()){
                throw new \Exception($validator->errors(),422);
            }
            if(!preg_match('/^=([^=]*)$/', $request->formula)){
                throw new \Exception(json_encode(['formula'=>['Invalid formula.']]),422);
            }
            $allready_exits=Fee::where(['code_id'=>$request->code_id,
                'year_id'=>$request->year_id])->count();
            if($allready_exits){
                throw new \Exception(json_encode(['formula'=>['The fee allready exits.']]),422);
            }
            $fee=Fee::create([
                'code_id'=>$request->code_id,
                'year_id'=>$request->year_id,
                'formula'=>$request->formula
            ]);
            if($fee){
                return Response([
                    'status'=>true,
                    'message'=> 'Fee is submited.',
                    'data' => [
                        'fee'=>$fee
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
