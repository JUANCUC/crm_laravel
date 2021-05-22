import React from 'react'
import ReactDOM from 'react-dom'

import {
    BrowserRouter as Router,
    Switch,
    Route,
    Redirect
} from "react-router-dom";

import { Layout } from '../Layout/Layout'
import { Login } from '../Login/Login'
import { getToken, deleteToken } from '../helpers/auth-helper'
import jwt_decode from "jwt-decode";

const isAuthenticated = () => {
    const token = getToken()
    let isValid = true

    try {
        isValid = jwt_decode(token)
    } catch (error) {
        return false
    }

    //console.log(token)
    return isValid
}

const MyRoute = (props) => (
    isAuthenticated()
        ? <Route {...props} />
        : <Redirect to="/" />
)

const RouteLogin = (props) => (
    isAuthenticated()
        ? <Redirect to="/dashboard" />
        : <Route {...props} />
)

const Logout = () => {
    console.log('logout')
    deleteToken()
    return <Redirect to="/" />
}


export const Index = () => (
    <Router>
        <Switch>
            <RouteLogin path="/" exact component={Login} />
            <MyRoute path="/dashboard" exact  component={Layout}  />
            <MyRoute path="/clientes" exact  component={Layout}  />
            <MyRoute path="/clientes/reportes/:id" exact  component={Layout}  />
            <MyRoute path="/About" exact  component={Layout}  />
            <Route path="/logout" exact component={Logout} />
            <Route path="*"  component={Layout}  />            
        </Switch>
    </Router>
)

if (document.getElementById("layout")) {
	ReactDOM.render(<Index />, document.getElementById("layout"));
}