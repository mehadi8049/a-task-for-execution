import React, {useState, useEffect} from 'react'
import { get, post } from '../Services';
const SetCodeF=()=>{
  const [message, setMessage] = useState('');
  const [code, setCode] = useState({'code':''});
  const [codes, setCodes] = useState([]);
  const [errors,setErrors]=useState({})
  const [isLoading,setIsLoading]=useState(true)
  const codeHandle=async (e)=>{
    e.preventDefault();
    const response = await post('/set-code',code);
    if(response?.status){
      setErrors({})
      setCode(prev => ({
        ...prev,
        ...{
          'code':''
        }
      }))
      const createdCode=response.data.code;
      setCodes(prev => ([
        ...prev,
        createdCode
      ]))
      setMessage(response.message)
    }else{
      const message=response.message;
      setErrors(prev=>({...prev,...message}))
    }
  }

  useEffect(()=>{
    ((async () => {
      const response = await get('/codes');
      if(response?.status){
        setCodes(response.data.codes);
        setIsLoading(false);
      }
    })())
   
  },[])


  return (
    <>
    <div className="container" style={{marginTop:'20px'}}>
      <div className="card">
          <div className="card-header">
          Set Code
          </div>
          <div className="card-body">
          <form onSubmit={codeHandle}>
          <p className='text-success'>{message?message:''}</p>
          <div className="mb-3">
            <label>Code <span className='text-danger'>*</span></label>
            <input
              type="text"
              className="form-control"
              placeholder="Code type here."
              value={code.code}
              onChange={(e)=>setCode(prev => ({
                ...prev,
                ...{'code':e.target.value}
              }))}
            />
            {errors && errors.code && (
              <p className="text-danger">
                {errors.code[0]}
              </p>
            )}
          </div>
          <button type="submit" className="btn btn-primary">Submit</button>
      </form>

      <br />
      <h2 className="mb-4">Codes Table</h2>
          {isLoading?(
          <div>
            <p>Loading....</p>
          </div>):(
            <table className="table table-striped">
                      <thead>
                          <tr>
                              <th scope="col">#</th>
                              <th scope="col">Code</th>
                          </tr>
                      </thead>
                      <tbody>
                          {codes.map((code, index) => (
                              <tr key={index}>
                                  <td>{index+1}</td>
                                  <td>{code.code}</td>
                              </tr>
                          ))}
                      </tbody>
            </table>
          )}
          </div>
      </div>
    </div>
      
    </>
  )


}

export default SetCodeF