import React from 'react';
import ReactDOM from 'react-dom'
import { makeStyles } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import CssBaseline from '@material-ui/core/CssBaseline';
import DashboardIcon from '@material-ui/icons/Dashboard';
import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';

const drawerWidth = 240;

const menu = [
  {
    name: 'Dashbaord',
    icon: <DashboardIcon/>
  }
]

const useStyles = makeStyles((theme) => ({
  
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    width: drawerWidth,
    padding: 10,
    background: 'var(--bg)'
  },
  // necessary for content to be below app bar
  toolbar: theme.mixins.toolbar,
  content: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.default,
    padding: theme.spacing(3),
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
                  {menu.map((el,index) =>(
                    <ListItem button key={index} style={{borderRadius: 4, backgroundColor: 'var(--text)'}}>
                      <ListItemIcon>{el.icon}</ListItemIcon>
                      <ListItemText primary={el.name} />
                    </ListItem>
                  ))}
                </List>
                <Divider />
            </Drawer>
        </>
    );
  }
if (document.getElementById('layout')) {
    ReactDOM.render(<Layout />, document.getElementById('layout'));
}