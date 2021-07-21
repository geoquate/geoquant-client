/*!

=========================================================
* Material Dashboard React - v1.10.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard-react
* Copyright 2021 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/material-dashboard-react/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
// @material-ui/icons
import Home from "@material-ui/icons/Home";
import Login from "@material-ui/icons/VerifiedUser";
import Dashboard from "@material-ui/icons/Dashboard";
import Person from "@material-ui/icons/Person";
import LibraryBooks from "@material-ui/icons/LibraryBooks";
import BubbleChart from "@material-ui/icons/BubbleChart";
import LocationOn from "@material-ui/icons/LocationOn";
import Notifications from "@material-ui/icons/Notifications";
import Event from "@material-ui/icons/CalendarTodayOutlined";
// core components/views for Admin layout
import HomePage from "views/Home/Home.js";
import LoginPage from "views/Login/Login.js";
import DashboardPage from "views/Dashboard/Dashboard.js";
import UserProfile from "views/UserProfile/UserProfile.js";
import TableList from "views/TableList/TableList.js";
import Typography from "views/Typography/Typography.js";
import Icons from "views/Icons/Icons.js";
import Maps from "views/Maps/Maps.js";
import EventPage from "views/Event/Event.js";
import NotificationsPage from "views/Notifications/Notifications.js";
// core components/views for RTL layout

const dashboardRoutes = [
  {
    path: "/home",
    name: "Home",
    rtlName: "",
    icon: Home,
    component: HomePage,
    layout: "/anonymous",
    protected: false,
  },
  {
    path: "/login",
    name: "Login",
    rtlName: "",
    icon: Login,
    component: LoginPage,
    layout: "/anonymous",
    protected: false,
  },
  {
    path: "/dashboard",
    name: "Dashboard",
    rtlName: "",
    icon: Dashboard,
    component: DashboardPage,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/user",
    name: "User Profile",
    rtlName: "",
    icon: Person,
    component: UserProfile,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/table",
    name: "Table List",
    rtlName: "",
    icon: "content_paste",
    component: TableList,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/typography",
    name: "Typography",
    rtlName: "",
    icon: LibraryBooks,
    component: Typography,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/icons",
    name: "Icons",
    rtlName: "",
    icon: BubbleChart,
    component: Icons,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/maps",
    name: "Maps",
    rtlName: "",
    icon: LocationOn,
    component: Maps,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/notifications",
    name: "Notifications",
    rtlName: "",
    icon: Notifications,
    component: NotificationsPage,
    layout: "/admin",
    protected: true,
  },
  {
    path: "/events",
    name: "Events",
    rtlName: "",
    icon: Event,
    component: EventPage,
    layout: "/admin",
    protected: true,
  },
];

export default dashboardRoutes;
