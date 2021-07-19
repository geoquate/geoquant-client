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
import React from "react";
import { render } from "react-dom";
import { BrowserRouter, Route, Switch, Redirect } from "react-router-dom";

import {
  FirebaseAuthProvider,
  IfFirebaseAuthed,
  IfFirebaseUnAuthed,
} from "@react-firebase/auth";
import firebase from "firebase";
import { config } from "./config";

// core components
import Admin from "layouts/Admin.js";
import Anonymous from "layouts/Anonymous.js";

import "assets/css/material-dashboard-react.css?v=1.10.0";

export const App = () => {
  return (
    <FirebaseAuthProvider {...config} firebase={firebase}>
      <div>
        <IfFirebaseAuthed>
          {() => {
            return (
              <>
                <BrowserRouter>
                  <Switch>
                    <Route path="/admin" component={Admin} />
                    <Redirect from="/" to="/admin/dashboard" />
                  </Switch>
                </BrowserRouter>
              </>
            );
          }}
        </IfFirebaseAuthed>
        <IfFirebaseUnAuthed>
          {() => {
            return (
              <BrowserRouter>
                <Switch>
                  <Route path="/anonymous" component={Anonymous} />
                  <Redirect from="/" to="/anonymous/home" />
                </Switch>
              </BrowserRouter>
            );
          }}
        </IfFirebaseUnAuthed>
      </div>
    </FirebaseAuthProvider>
  );
};
render(<App />, document.getElementById("root"));
