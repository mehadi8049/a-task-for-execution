import { useState,useEffect } from "react";
import { get, post } from "../Services";

const SetFeeF=()=>{
  const [feeData, SetFeeData] = useState({
      'code_id':'',
      'year_id':'',
      'fee':'',
  });
  const [message, setMessage] = useState('');
  const [errors,setErrors]=useState({})
  const [codes, setCodes] = useState([]);
  const [years, setYears] = useState([]);
  const [fees, setFees] = useState([]);
  const [isLoading,setIsLoading]=useState(true)
  const feeHandle=async (e)=>{
    e.preventDefault();
    const response = await post('/set-fee',feeData);
    
    if(response?.status){
      setErrors({})
      SetFeeData(prev => ({
        ...prev,
        ...{
          'code_id':'',
          'year_id':'',
          'formula':'',
        }
      }))
      const feesResponse = await get('/fees');
      setFees(feesResponse.data.fees);
      setMessage(response.message)
    }else{
      const message=response.message;
      setErrors(prev=>({...prev,...message}))
    }
  }
  useEffect(()=>{
    ((async () => {
      const codeRes = await get('/codes');
      const yearRes = await get('/years');
      const response = await get('/fees');
      if(codeRes?.status&&yearRes?.status&&response?.status){
        setCodes(codeRes.data.codes);
        setYears(yearRes.data.years);
        setFees(response.data.fees);
        setIsLoading(false);
      }
    })())
  },[])
  
  return (
    <div className="container" style={{marginTop:'20px'}}>
       <div className="card">
          <div className="card-header">
            Fee
          </div>
          <div className="card-body">
            {isLoading?(
              <div>
                <p>Loading....</p>
              </div>):(
                <form onSubmit={feeHandle}>
                  <p className='text-success'>{message?message:''}</p>
                  <div className="form-group">
                    <label htmlFor="code">Code <span className='text-danger'>*</span></label>
                    <select className="form-control" id="code" defaultValue={feeData.code_id}
                    onChange={(e)=>SetFeeData(prev => ({
                      ...prev,
                      ...{'code_id':e.target.value}
                    }))}>
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
                    <label htmlFor="year">Year <span className='text-danger'>*</span></label>
                    <select className="form-control" id="year" defaultValue={feeData.year_id}
                    onChange={(e)=>SetFeeData(prev => ({
                      ...prev,
                      ...{'year_id':e.target.value}
                    }))}>
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
                    <label htmlFor="formula">Formula <span className='text-danger'>*</span></label>
                    <input type="text" value={feeData.formula} className="form-control" id="formula" placeholder="Type formula here."
                     onChange={(e)=>SetFeeData(prev => ({
                      ...prev,
                      ...{'formula':e.target.value}
                    }))}
                    />
                    <p style={{fontSize:'12px'}}>Valid formula starting with exactly one equal (=)</p>
                    {errors && errors.formula && (
                      <p className="text-danger">
                        {errors.formula[0]}
                      </p>
                    )}
                  </div><br />
                  <button type="submit" className="btn btn-primary">Submit</button>
                </form>
              )
            }
            
          </div>
          <div className="card-body">
          <br />
            <h2 className="mb-4">Fees Table</h2>
            <table className="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Code</th>
                        <th scope="col">Year</th>
                        <th scope="col">Fee</th>
                    </tr>
                </thead>
                <tbody>
                    {fees.map((fee, index) => (
                        <tr key={index}>
                            <td>{index+1}</td>
                            <td>{fee.fcode?.code}</td>
                            <td>{fee.fyear?.year}</td>
                            <td>{fee.formula}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
          </div>
        </div>
    </div>   
  )
}
 export default SetFeeF;
