import React from 'react'
import { Routes, Route, Link } from 'react-router-dom'
import Login from '../components/Login'
import SetCodeF from '../components/SetCodeF'
import SetYearF from '../components/SetYearF'
import SetKeyValue from '../components/SetKeyValue'
import SetFeeF from '../components/SetFeeF'
import Dashboard from '../components/Dashboard'
import ProtectedRoute from './ProtectedRoute'
import PublicRoute from './PublicRoute'


export default function Web() {
  return (
    <Routes>
        <Route exact path="/" element={
             <PublicRoute>
                  <Login />
             </PublicRoute>
        }/>
        <Route path="/sign-in" element={
             <PublicRoute>
                  <Login />
             </PublicRoute>
        }/>
 
        <Route path="/dashboard" element={
            <ProtectedRoute>
              <Dashboard />
            </ProtectedRoute>
        } />
        <Route path="/set-code" element={
            <ProtectedRoute>
              <SetCodeF/>
            </ProtectedRoute>
        } />
        <Route path="/set-year" element={
            <ProtectedRoute>
              <SetYearF />
            </ProtectedRoute>
        } />
        <Route path="/set-key-value" element={
            <ProtectedRoute>
              <SetKeyValue />
            </ProtectedRoute>
        } />
        <Route path="/set-fee" element={
            <ProtectedRoute>
              <SetFeeF/>
            </ProtectedRoute>
        } />
    </Routes>
  )
}
