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
    deleteToken()
    return <Redirect to="/" />
}


export const Index = () => (
    <Router>
        <Switch>
            <Route path="/" exact component={Login} />
            <MyRoute path="/dashboard" exact  component={Layout}  />
            <MyRoute path="/clientes" exact  component={Layout}  />
            <MyRoute path="/clientes/reportes" exact  component={Layout}  />
            <MyRoute path="/About" exact  component={Layout}  />
            <Route to="/logout" exact component={Logout} />
        </Switch>
    </Router>
)

if (document.getElementById("layout")) {
	ReactDOM.render(<Index />, document.getElementById("layout"));
}