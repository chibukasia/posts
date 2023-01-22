import logo from './logo.svg';
import './App.css';
import Login from './login';
import { useState, useEffect } from 'react';

function App() {
  const [user, setUser]=useState(null)

  useEffect(()=>{
    fetch('http://localhost:3000/me').then(res=>{
      if (res.ok){
        res.json().then(setUser(user))
      }
    })
  },[])
  return (
    
    <div className="App">
      {user ? <h2>Hello {user.username}</h2>: <Login setUser={setUser}/>}
    </div>
  );
}

export default App;
