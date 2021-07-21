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
import { RecoilRoot } from "recoil";
import { render } from "react-dom";
import { BrowserRouter, Route, Switch, Redirect } from "react-router-dom";

import { useSigninCheck, FirebaseAppProvider } from "reactfire";

import { config } from "./config";

// core components
import Admin from "layouts/Admin.js";
import Anonymous from "layouts/Anonymous.js";

import "assets/css/material-dashboard-react.css?v=1.10.0";

const LoggedIn = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/admin" component={Admin} />
        <Redirect from="/" to="/admin/dashboard" />
      </Switch>
    </BrowserRouter>
  );
};

const Anon = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/anonymous" component={Anonymous} />
        <Redirect from="/" to="/anonymous/home" />
      </Switch>
    </BrowserRouter>
  );
};
export const App = () => {
  const { status, data: signInCheckResult } = useSigninCheck();

  if (status === "loading") {
    return <div>loading</div>;
  }

  if (signInCheckResult.signedIn === true) {
    return <LoggedIn />;
  } else {
    return <Anon />;
  }
};
render(
  <RecoilRoot>
    <FirebaseAppProvider firebaseConfig={config}>
      <App />
    </FirebaseAppProvider>
  </RecoilRoot>,
  document.getElementById("root")
);
