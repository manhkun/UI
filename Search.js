import React, { Component } from "react";
import { StyleSheet, Text, View, TextInput } from "react-native";
import { Button } from "react-native-elements";

export default class Search extends Component {
  render() {
    return (
      <View style={search_styles.container}>
        <View style={search_styles.search_view}>
          <Text style={search_styles.search_text}>Search</Text>
        </View>
        <TextInput
          style={search_styles.input_view}
          placeholder="Search for quizzes"
        />
        <Button
          title="Filter"
          titleStyle={{ fontWeight: "bold", color: "black" }}
          buttonStyle={{ backgroundColor: "white" }}
          containerStyle={search_styles.filter_button}
        />
      </View>
    );
  }
}

const search_styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    left: "5%",
    top: "5%",
  },
  filter_button: {
    top: "2%",
    left: "69%",
    borderRadius: 20,
    width: 80,
    height: 40,
    borderColor: "#9b00cf",
    borderWidth: 2,
    justifyContent: "center",
    alignItems: "center",
  },
  search_view: {
    left: "-5%",
    borderBottomColor: "#949494",
    borderBottomWidth: 1,
  },
  search_text: {
    left: "5%",
    fontSize: 40,
  },
  input_view: {
    borderRadius: 10,
    borderColor: "#d4d2d2",
    borderWidth: 1,
    width: "90%",
    paddingTop: "3%",
    paddingLeft: "5%",
    paddingBottom: "3%",
    paddingRight: "5%",
    fontSize: 25,
    color: "#292929",
    top: "1%",
  },
});
