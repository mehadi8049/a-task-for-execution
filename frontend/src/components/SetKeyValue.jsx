import React, {useState, useEffect} from 'react'
import { get, post } from '../Services';
const SetKeyValue=()=>{
  const [message, setMessage] = useState('');
  const [keyValue, setKeyValue] = useState({
    'key':'',
    'value':'',
   });
  const [keyValues, setKeyValues] = useState([]);
  const [errors,setErrors]=useState({})
  const [isLoading,setIsLoading]=useState(true)
  const keyValueHandle=async (e)=>{
    e.preventDefault();
    const response = await post('/set-key-value',keyValue);
    if(response?.status){
      setErrors({})
      setKeyValue(prev => ({
        ...prev,
        ...{
          'key':'',
          'value':'',
        }
      }))
      const createdKeyValue=response.data.keyValue;
      setKeyValues(prev => ([
        ...prev,
        createdKeyValue
      ]))
      setMessage(response.message)
    }else{
      const message=response.message;
      setErrors(prev=>({...prev,...message}))
    }
  }

  useEffect(()=>{
    ((async () => {
      const response = await get('/key-values');
      if(response?.status){
        setKeyValues(response.data.keyValues);
        setIsLoading(false);
      }
    })())
   
  },[])


  return (
    <>
    <div className="container" style={{marginTop:'20px'}}>
      <div className="card">
          <div className="card-header">
          Set Key and Value
          </div>
          <div className="card-body">
          <form onSubmit={keyValueHandle}>
          <p className='text-success'>{message?message:''}</p>
          <div className="mb-3">
            <label>Key <span className='text-danger'>*</span></label>
            <input
              type="text"
              className="form-control"
              placeholder="Key type here."
              value={keyValue.key}
              onChange={(e)=>setKeyValue(prev => ({
                ...prev,
                ...{'key':e.target.value}
              }))}
            />
            {errors && errors.key && (
              <p className="text-danger">
                {errors.key[0]}
              </p>
            )}
          </div>
          <div className="mb-3">
            <label>Value <span className='text-danger'>*</span></label>
            <input
              type="text"
              className="form-control"
              placeholder="Value type here."
              value={keyValue.value}
              onChange={(e)=>setKeyValue(prev => ({
                ...prev,
                ...{'value':e.target.value}
              }))}
            />
            {errors && errors.value && (
              <p className="text-danger">
                {errors.value[0]}
              </p>
            )}
          </div>
          <button type="submit" className="btn btn-primary">Submit</button>
      </form>

      <br />
      <h2 className="mb-4">Key and Value Table</h2>
          {isLoading?(
          <div>
            <p>Loading....</p>
          </div>):(
            <table className="table table-striped">
                      <thead>
                          <tr>
                              <th scope="col">#</th>
                              <th scope="col">Key</th>
                              <th scope="col">Value</th>
                          </tr>
                      </thead>
                      <tbody>
                          {keyValues.map((key_value, index) => (
                              <tr key={index}>
                                  <td>{index+1}</td>
                                  <td>{key_value.key}</td>
                                  <td>{key_value.value}</td>
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

export default SetKeyValue;