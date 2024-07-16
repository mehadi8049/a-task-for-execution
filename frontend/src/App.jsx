import React,{ useEffect, useState } from 'react'

import '../node_modules/bootstrap/dist/css/bootstrap.min.css'
import '../node_modules/bootstrap/dist/js/bootstrap.bundle.min';
import { BrowserRouter as Router } from 'react-router-dom'
import Web from './routes/Web'
import Navigation from './inc/Navigation'

function App() {
  useEffect(() => {
    document.title = env.REACT_APP_TITLE || 'Default';
  }, []);
  
  return (
    <Router>
      <div className="App">
        <Navigation/>
        
            <Web/>
      </div>
    </Router>
  )
}

export default App
