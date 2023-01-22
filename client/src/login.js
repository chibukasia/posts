import React, { useState } from 'react'
// import { useNavigate } from 'react-router-dom'

function Login({setUser}) {
  const [formData, setFormData] = useState({
    username: '',
    password: '',
  })
  
//   const navigate = useNavigate()
  function handleChange(e){
    let name = e.target.name 
    let value = e.target.value 

    setFormData({...formData, [name]: value})
  }

  function handleSubmit(e){
    e.preventDefault()
    fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData)
    }).then(res=>{
        if(res.ok){
            res.json().then(user=>{
                setUser(user.user)
                // navigate('/')
            })
        }else{
            res.json().then(err=>console.log(err))
        }
    })
  }
  return (
    <div>
        <form onSubmit={handleSubmit}>
            <input type={'text'} name='username' onChange={handleChange}/>
            <input type={'password'} name='password' onChange={handleChange}/>
            <input type={'submit'} value='login'/>
        </form>
    </div>
  )
}

export default Login