import React, { Component } from "react";
import { View, StyleSheet } from "react-native";
import Quiz from "./Quiz";

export default class Start extends Component {
  render() {
    return (
      <View>
        <Quiz style={styles.container} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: 400,
  },
});
