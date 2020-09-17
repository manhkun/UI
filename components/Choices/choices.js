import React, { Component } from "react";
import { FlatList, Text, View, SafeAreaView } from "react-native";
import Choice from "./choice";
export default class Choices extends Component {
  constructor(props) {
    super(props);
    this.state = {
      question: "What is the largest planet in solar system?",
      choices: [
        { id: 1, title: "Sun", color: "#3F6BA9" },
        { id: 2, title: "Jupiter", color: "#5099A4" },
        { id: 3, title: "Earth", color: "#E1AB48" },
        { id: 4, title: "Venus", color: "#C45C6B" },
      ],
    };
  }
  render() {
    const { question, choices } = this.state;
    return (
      <SafeAreaView>
        <View>
          <View>
            <Text>{question}</Text>
          </View>
          <View>
            {choices.map((choice) => (
              <Choice title={choice.title} color={choice.color} />
            ))}
          </View>
        </View>
      </SafeAreaView>
    );
  }
}
const styles = StyleSheet