import React from "react";
import { useHistory } from "react-router-dom";
// @material-ui/core components
import { makeStyles } from "@material-ui/core/styles";
// core components
import GridItem from "components/Grid/GridItem.js";
import GridContainer from "components/Grid/GridContainer.js";

import Card from "components/Card/Card.js";
import CardHeader from "components/Card/CardHeader.js";
import CardBody from "components/Card/CardBody.js";

import { Checkbox, Input, Select, MenuItem } from "@material-ui/core";

import { useSigninCheck } from "reactfire";
import { useForm, Controller } from "react-hook-form";

const useStyles = makeStyles((theme) => ({
  root: {
    "& .MuiTextField-root": {
      margin: theme.spacing(1),
      width: 200,
    },
  },
}));

export default function Event() {
  const classes = useStyles();

  const history = useHistory();

  const { data: signInCheckResult } = useSigninCheck();

  const { control, handleSubmit } = useForm();
  // const { isDirty, isSubmitting } = formState;

  const onSubmit = (data) => alert(JSON.stringify(data, null, 2));

  if (signInCheckResult.signedIn === true) {
    return (
      <Card>
        <CardHeader color="primary">
          <h4 className={classes.cardTitleWhite}>Event Registration</h4>
        </CardHeader>
        <CardBody>
          <GridContainer>
            <GridItem xs={12} sm={12} md={4}>
              <form className={classes.root} onSubmit={handleSubmit(onSubmit)}>
                <label>First Name</label>
                <Controller
                  render={({ field }) => <Input {...field} />}
                  name="firstName"
                  control={control}
                  defaultValue=""
                  className="materialUIInput"
                />
                <label>First Name</label>
                <Controller
                  render={({ field }) => <Input {...field} />}
                  name="lastName"
                  control={control}
                  defaultValue=""
                />
                <label>Ice Cream Preference</label>
                <Controller
                  name="iceCreamType"
                  render={({ field }) => (
                    <Select {...field}>
                      <MenuItem value="chocolate">Chocolate</MenuItem>
                      <MenuItem value="strawberry">Strawberry</MenuItem>
                      <MenuItem value="vanilla">Vanilla</MenuItem>
                    </Select>
                  )}
                  control={control}
                  defaultValue=""
                />
                <Controller
                  name="Checkbox"
                  control={control}
                  render={({ field }) => <Checkbox {...field} />}
                />

                <input type="submit" />
              </form>
            </GridItem>
          </GridContainer>
        </CardBody>
      </Card>
    );
  } else {
    history.push("anoymous/home");
  }
}
