import React from "react";
import ReactDOM from "react-dom";
import { makeStyles } from "@material-ui/core/styles";
import Drawer from "@material-ui/core/Drawer";
import CssBaseline from "@material-ui/core/CssBaseline";
import DashboardIcon from "@material-ui/icons/Dashboard";
import PeopleIcon from "@material-ui/icons/People";
import MonetizationOnIcon from '@material-ui/icons/MonetizationOn';
import List from "@material-ui/core/List";
import Divider from "@material-ui/core/Divider";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import ListItemText from "@material-ui/core/ListItemText";

const drawerWidth = 240;

const menu = [
    {
        name: 'Dashboard',
        iconName: 'fas fa-tachometer-alt',
    },
    {
        name: 'Clientes',
        iconName: 'fa fa-users',
    },
	{
		name: 'Ventas',
        iconName: 'fas fa-chart-line',
	},
	{
		name: 'About',
		iconName: 'fas fa-question-circle'
	}
];

const useStyles = makeStyles((theme) => ({
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
    content: {
        flexGrow: 1,
        backgroundColor: theme.palette.background.default,
        padding: theme.spacing(3),
    },
    active: {
        backgroundColor: "var(--active)",
    },
    btnMenu: {
        borderRadius: 4,
        color: "var(--white)",
		fontWeight: 700,
        "&:hover": {
            backgroundColor: "var(--active)",
        },
        "& i": {
            color: "var(--white)",
			fontSize: 20
        },
    },
}));

export default function Layout() {
    const classes = useStyles();

    return (
        <>
            <CssBaseline />
            <Drawer
                className={classes.drawer}
                variant="permanent"
                classes={{
                    paper: classes.drawerPaper,
                }}
                anchor="left"
            >
                <div className={classes.toolbar} />
                <Divider />
                <List>
                    {menu.map((el, index) => (
                        <ListItem
                            button
                            key={index}
                            className={[
                                classes.btnMenu,
                                index == 0 && [classes.active, 'shadow'].join(' '),
                            ].join(" ")}
                        >
                            <ListItemIcon><i className={el.iconName}></i></ListItemIcon>
                            <ListItemText primary={el.name} />
                        </ListItem>
                    ))}
                </List>
                <Divider />
            </Drawer>
        </>
    );
}
if (document.getElementById("layout")) {
    ReactDOM.render(<Layout />, document.getElementById("layout"));
}
