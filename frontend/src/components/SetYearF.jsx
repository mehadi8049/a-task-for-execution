import React, {useState, useEffect} from 'react'
import { get, post } from '../Services';
const SetYearF=()=>{
  const [message, setMessage] = useState('');
  const [year, setYear] = useState({'year':''});
  const [years, setYears] = useState([]);
  const [errors,setErrors]=useState({})
  const [isLoading,setIsLoading]=useState(true)
  const yearHandle=async (e)=>{
    e.preventDefault();
    const response = await post('/set-year',year);
    if(response?.status){
      setErrors({})
      setYear(prev => ({
        ...prev,
        ...{
          'year':''
        }
      }))
      const createdYear=response.data.year;
      setYears(prev => ([
        ...prev,
        createdYear
      ]))
      setMessage(response.message)
    }else{
      const message=response.message;
      setErrors(prev=>({...prev,...message}))
    }
  }

  useEffect(()=>{
    ((async () => {
      const response = await get('/years');
      if(response?.status){
        setYears(response.data.years);
        setIsLoading(false);
      }
    })())
   
  },[])


  return (
    <>
    <div className="container" style={{marginTop:'20px'}}>
      <div className="card">
          <div className="card-header">
          Set Year
          </div>
          <div className="card-body">
          <form onSubmit={yearHandle}>
          <p className='text-success'>{message?message:''}</p>
            <div className="mb-3">
              <label>Year <span className='text-danger'>*</span></label>
              <input
                type="text"
                className="form-control"
                placeholder="Year example: 2024-2025"
                value={year.year}
                onChange={(e)=>setYear(prev => ({
                  ...prev,
                  ...{'year':e.target.value}
                }))}
              />
              {errors && errors.year && (
                <p className="text-danger">
                  {errors.year[0]}
                </p>
              )}
            </div>
            <button type="submit" className="btn btn-primary">Submit</button>
        </form>

          <br />
          <h2 className="mb-4">Years Table</h2>
          {isLoading?(
          <div>
            <p>Loading....</p>
          </div>):(
          <table className="table table-striped">
              <thead>
                  <tr>
                      <th scope="col">#</th>
                      <th scope="col">Year</th>
                  </tr>
              </thead>
              <tbody>
                  {years.map((year, index) => (
                      <tr key={index}>
                          <td>{index+1}</td>
                          <td>{year.year}</td>
                      </tr>
                  ))}
              </tbody>
          </table>)}
          </div>
      </div>
    </div>
        
    </>
  )


}

export default SetYearF