import React from "react";
import { useHistory } from "react-router-dom";
// @material-ui/core components

import { useSigninCheck } from "reactfire";
import firebase from "firebase";

export default function Login() {
  const history = useHistory();
  const { data: signInCheckResult } = useSigninCheck();

  if (signInCheckResult.signedIn === true) {
    history.push("admin/dashboard");
  } else {
    return (
      <button
        onClick={() => {
          const googleAuthProvider = new firebase.auth.GoogleAuthProvider();
          firebase.auth().signInWithPopup(googleAuthProvider);
        }}
      >
        Sign In with Google
      </button>
    );
  }
}
