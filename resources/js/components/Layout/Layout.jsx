import React from "react";
import ReactDOM from "react-dom";
import { makeStyles } from "@material-ui/core/styles";
import Drawer from "@material-ui/core/Drawer";
import CssBaseline from "@material-ui/core/CssBaseline";
import List from "@material-ui/core/List";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";

import {
  BrowserRouter as Router,
  Switch,
  Route,
  NavLink,
  Link,
  Redirect
} from "react-router-dom";

import { Dashboard } from '../Dashboard/Dashboard'
import { Client } from '../Dashboard/Client'
import { DashboardClient } from '../Dashboard/DashboardClient'


import { initAxios, deleteToken } from '../helpers/auth-helper'

initAxios()

const drawerWidth = 240;

const menu = [
	{
		name: 'Dashboard',
		iconName: 'fas fa-tachometer-alt',
		route: "/dashboard",
		exact: true,
		main: () => <Dashboard/>
	},
	{
		name: 'Clientes',
		iconName: 'fa fa-users',
		route: "/clientes",
		exact: true,
		main: () => <Client/>
	},
	{
		name: 'About',
		iconName: 'fas fa-question-circle',
		route: "/about",
		exact: true,
		main: () => <h1>Nosotros</h1>
	}
];



const useStyles = makeStyles((theme) => ({
	root: {
		display: 'flex',
		'& a': {
			textDecoration: 'none'
		},
		'& .active .MuiButtonBase-root': {
			backgroundColor: "var(--active)",
		}
	},
	drawer: {
		width: drawerWidth,
		flexShrink: 0,
	},
	drawerPaper: {
		width: drawerWidth,
		padding: 10,
		background: "var(--bg)",
	},
	// necessary for content to be below app bar
	toolbar: theme.mixins.toolbar,
	
	btnMenu: {
		borderRadius: 4,
		color: "var(--white)",
		fontWeight: 700,
		'& a': {
			color: '#fff',
			textDecoration: 'none'
		},
		"&:hover": {
			backgroundColor: "var(--active)",
			color: '#fff'
		},
		"& i": {
			color: "var(--white)",
			fontSize: 20
		},
	},
}));

export const Layout = () => {
	const classes = useStyles()

	return (
		<Router>
			<div className={classes.root}>
				<CssBaseline />
				<Drawer
				className={classes.drawer}
				variant="permanent"
				classes={{
					paper: classes.drawerPaper,
				}}
				anchor="left"
				>
				<div className={classes.toolbar} ></div>
				<Divider />
				<List>
					{menu.map((el, index) => (
						<NavLink to={el.route} key={index} activeClassName={classes.active}>
							<ListItem button className={classes.btnMenu}>
								<ListItemIcon><i className={el.iconName}></i></ListItemIcon>
								<ListItemText primary={el.name} />
							</ListItem>
						</NavLink>
					))}
					<Link to="/logout">
						<ListItem button className={classes.btnMenu}>
							<ListItemIcon><i className="fas fa-sign-out-alt"></i></ListItemIcon>
							<ListItemText primary="Cerrar sesion" />
						</ListItem>
					</Link>
				</List>
				<Divider />
				<Switch>
					{menu.map((route, index) => (
						<Route
							key={index}
							path={route.route}
							exact={route.exact}
						/>
					))}
					<Route path={`/clientes/reportes`} exact/>
					<Route path="/" exact/>
					<Route path="/logout" exact/>
				</Switch>
				</Drawer>
				<main className="container-fluid p-5" style={{position: 'relative', height: '100vh'}}>
					<Switch>
						{menu.map((route, index) => (
							<Route
								key={index}
								path={route.route}
								exact={route.exact}
								children={<route.main />}
							/>
						))}
						<Route path={`/clientes/reportes/:id`} exact children={<DashboardClient/>}/>
						<Route path="/logout" exact component={Logout}/>
					</Switch>
				</main>
		</div>
		</Router>
	);
}

const Logout = () => {
    deleteToken()
    return <Redirect to="/" />
}
