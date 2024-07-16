import { Link, NavLink } from 'react-router-dom'
import { useContext } from 'react';
import { AuthContext } from '../context/AuthContext';
import Logout from '../components/Logout';

const Navigation = () => {
    const user = useContext(AuthContext);
    return (
        <>
        {user?(
            <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <div className="container">
            <NavLink exact="true" className="navbar-brand" to={'/dashboard'}>Dashboard</NavLink>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto">
                       <li className="nav-item">
                            <NavLink exact="true" className="nav-link" to={'/set-fee'}>Set Fee</NavLink>
                        </li>
                        <li className="nav-item">
                            <NavLink exact="true" className="nav-link" to={'/set-year'}>Set Year</NavLink>
                        </li>
                        <li className="nav-item">
                            <NavLink exact="true" className="nav-link" to={'/set-key-value'}>Set Key and Value</NavLink>
                        </li>
                       <li className="nav-item">
                            <NavLink exact="true" className="nav-link" to={'/set-code'}>Set Code</NavLink>
                        </li>
                        
                        <li className="nav-item">
                            <Link className="nav-link" onClick={Logout}>Logout</Link>
                        </li>
                    </ul>
                </div>
            </div>
            </nav>
        ):(
            <div></div>
        )}
        
        </>
        
    )
};

export default Navigation;  