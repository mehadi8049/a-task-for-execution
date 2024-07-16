import { useState,useEffect } from "react";
import { get, post } from "../Services";

const SetFeeF=()=>{
  const [message, setMessage] = useState('');
  const [fee, setFee] = useState('');
  const [code_id, setCodeID] = useState('');
  const [year_id, setYearID] = useState('');
  const [errors,setErrors]=useState({})
  const [codes, setCodes] = useState([]);
  const [years, setYears] = useState([]);
  const [isLoading,setIsLoading]=useState(true)
  const handleChangeCode=async (e)=>{
      e.preventDefault();
      setCodeID(e.target.value)
      const data={
        'code_id': e.target.value,
        'year_id': year_id
      }
      const feeByYearRes=await get('/fee-by-year-code',data);
      if(feeByYearRes?.status){
        setErrors({})
        setFee(feeByYearRes.data.fee.fee)
        setMessage(feeByYearRes.message)
      }else{
        const message=feeByYearRes.message;
        setErrors(prev=>({...prev,...message}))
      }
  }
  const handleChangeYear=async (e)=>{
      e.preventDefault();
      setYearID(e.target.value)
      const data={
        'code_id': code_id,
        'year_id': e.target.value
      }
      const feeByYearRes=await get('/fee-by-year-code',data);
      if(feeByYearRes?.status){
        setErrors({})
        setFee(feeByYearRes.data.fee.fee)
        setMessage(feeByYearRes.message)
      }else{
        const message=feeByYearRes.message;
        setErrors(prev=>({...prev,...message}))
      }
  }
  useEffect(()=>{
    ((async () => {
      const codeRes = await get('/codes');
      const yearRes = await get('/years');
      if(codeRes?.status&&yearRes?.status){
        setCodes(codeRes.data.codes);
        setYears(yearRes.data.years);
        setIsLoading(false);
      }
    })())
  },[])
  
  return (
    <div className="container" style={{marginTop:'20px'}}>
       <div className="card">
          <div className="card-header">
          Code renewal fee
          </div>
          <div className="card-body">
            {isLoading?(
              <div>
                <p>Loading....</p>
              </div>):(
                <form>
                  <div className="form-group">
                    <label htmlFor="code_id">Code <span className='text-danger'>*</span></label>
                    <select className="form-control" id="code_id" defaultValue={code_id}
                    onChange={handleChangeCode}>
                      <option>Select one </option>
                      {codes.map((code, index) => (
                        <option key={index} value={code.id}>{code.code}</option>
                      ))}
                    </select>
                    {errors && errors.code_id && (
                      <p className="text-danger">
                        {errors.code_id[0]}
                      </p>
                    )}
                  </div>
                  <div className="form-group">
                    <label htmlFor="year_id">Year <span className='text-danger'>*</span></label>
                    <select className="form-control" id="year_id"  defaultValue={year_id}
                    onChange={handleChangeYear}>
                      <option>Select one</option>
                      {years.map((year, index) => (
                        <option key={index} value={year.id}>{year.year}</option>
                      ))}
                    </select>
                    {errors && errors.year_id && (
                      <p className="text-danger">
                        {errors.year_id[0]}
                      </p>
                    )}
                  </div>
                  <div className="form-group">
                    <label htmlFor="fee">Fee </label>
                    <input type="number" value={fee} className="form-control" id="fee" placeholder="Type fee here."
                    onChange={(e)=>setFee(e.target.value)}
                    />
                  </div><br />
                </form>
              )
            }
            
          </div>
        </div>
    </div>   
  )
}
 export default SetFeeF;
