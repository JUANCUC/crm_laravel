import React, { useState, useEffect } from 'react'
import banner from '../images/banner.svg'

import { setToken } from '../helpers/auth-helper'

export const Login = (props) => {
    
    const [email, setEmail] = useState(null)
    const [password, setPassword] = useState(null)
    const [errors, setErrors] = useState({})

    const SignIn = async values => {
        try {
            const response = await axios({
				method: 'POST',
				url: '/login',
				headers: {
					'Content-Type': 'application/json',
				},
				data: JSON.stringify(values)
			})

            const data = response.data
            setToken(data.token)
            props.history.push('/dashboard')
        } catch (error) {
            console.log(error.message)
        }
    }

    const validate = values => {
		const errors = {}

		if(!values.email) errors.email = true
		if(!values.password) errors.password = true

		return errors
	}

    const handleSubmit = e => {
		e.preventDefault()
		
		const sinErrors = { email, password }
		const result = validate(sinErrors)
		
		setErrors(result)

		if(!Object.keys(result).length) {
            SignIn(sinErrors)
		}

	}

    const handleChange = ({target}) => {
        const { name, value } = target

        if(name === 'email') setEmail(value)
		if(name === 'password') setPassword(value)
    }

    return (
        <div className="bg-light" style={{height: '100vh', position: 'relative'}} >
            <div className="container-fluid h-100">
                <div className="row justify-content-center align-items-center h-100">
                    <div className="col-md-4 img d-none d-sm-none d-md-flex d-lg-flex  bg-dark" 
                        style={{
                            
                            right: 0,
                            top:0,
                            width: 600,
                            height: '100%',
                            alignContent: 'center',
                            alignItems: 'center',
                            justifyContent: 'center',
                            display: 'flex'
                        }}
                    >
                        <img src={banner} alt="iniciar sesion" width="100%" height="auto" />
                    </div> 
                    <div className="col-md-8 align-items-center" >
                        <form style={{width: 330, margin: '0 auto'}} onSubmit={handleSubmit}>
                            <h2 className="text-center mb-4">Iniciar sesión</h2>
                            <div className="form-group">
                                <label htmlFor="username">Correo electrónico</label>
                                <input 
                                    className="form-control" 
                                    name="email" 
                                    id="username" 
                                    type="email" 
                                    placeholder="usuario@mail.com" 
                                    onChange={handleChange}
                                />

                                {errors.email && 
                                    <div className="invalid-feedback d-block">
                                       Campo requerido
                                    </div>
                                }
                            </div>
                            <div className="form-group">
                                <label htmlFor="password">Contraseña</label>
                                <input 
                                    className="form-control" 
                                    name="password" 
                                    id="password" 
                                    type="password" 
                                    placeholder="contraseña"
                                    onChange={handleChange}
                                />
                                {errors.password && 
                                    <div className="invalid-feedback d-block">
                                        Campo requerido
                                    </div>
                                }
                            </div>
                            <button className="btn btn-primary btn-block">Iniciar sesion</button>
                        </form>
                        
                    </div>       
                                
                </div>

                
            </div>
        </div>
    )
}