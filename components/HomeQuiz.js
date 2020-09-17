import React, {Component} from 'react';
import {View, Text, Dimensions, StyleSheet, SafeAreaView, Image, Keyboard, TouchableWithoutFeedback,
    FlatList, ScrollView, TextInput, TouchableOpacity} from 'react-native';
import Quiz from './Quiz';
import TaskBar from './TaskBar';
<<<<<<< HEAD
import Header from './Header';

const screen = Dimensions.get('window');

export default class HomeQuiz extends Component {
    constructor(props){
        super(props);
        this.state = {
            nameTab: "Home"
        }
    }
    render(){
        const {nameTab} = this.props;
=======
const screen = Dimensions.get('window');

export default class HomeQuiz extends Component {
    render(){
>>>>>>> 840068a92d701e0e0a316029ff24b3e46708721c
        return(  
        <SafeAreaView style={styles.container}>
            <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
                <ScrollView showsVerticalScrollIndicator={false}>
                    <View style={styles.container}>
<<<<<<< HEAD
                        <Header nameTab={this.state.nameTab}/>
=======
                        <View style={styles.header}>
                            <Text style={styles.homeText}>Home</Text>
                            <TouchableOpacity style={styles.menu}>
                                <View style={styles.menuButton}>
                                    <Image source={require('../images/menu-button.png')}
                                            style={{width: 20, height: 20}}></Image>
                                </View>
                            </TouchableOpacity>
                        </View>
>>>>>>> 840068a92d701e0e0a316029ff24b3e46708721c
                        <View style={styles.joinGame}>
                            <TextInput 
                                style={styles.inputGameCode}
                                placeholder='Enter a game code'
                            >
                            </TextInput>
                            <TouchableOpacity
                                style={styles.joinGameButtonContainer}
                            >
                                <Text style={styles.joinGameButtonText}>Join a game</Text>
                            </TouchableOpacity>
                        </View>
                            <View style={styles.listQuizContainer}>
                                <Text style={styles.titleTopic}>Science</Text>
                                <ScrollView
                                    horizontal={true}
                                    showsHorizontalScrollIndicator={false}
                                >
                                    <Quiz/>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                </ScrollView>                    
                            </View>
                            <View style={styles.listQuizContainer}>
                                <Text style={styles.titleTopic}>Science</Text>
                                <ScrollView
                                    horizontal={true}
                                    showsHorizontalScrollIndicator={false}
                                >
                                    <Quiz/>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                </ScrollView>                    
                            </View>
                            <View style={styles.listQuizContainer}>
                                <Text style={styles.titleTopic}>Science</Text>
                                <ScrollView
                                    horizontal={true}
                                    showsHorizontalScrollIndicator={false}
                                >
                                    <Quiz/>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                    <Quiz></Quiz>
                                </ScrollView>                    
                            </View>
                    </View>
                </ScrollView>
            </TouchableWithoutFeedback>
            <TaskBar/>
        </SafeAreaView>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        flexDirection: 'column',
    },
<<<<<<< HEAD
=======
    header: {
        width: screen.width,
        height: 66,
        flexDirection: 'row',
        position: "relative"
    },
    homeText: {
        fontSize: 30,
        fontWeight: 'bold',
        position: 'absolute',
        marginLeft: 12,
        top: 10
    },
    menu:{
        marginRight: 12,
        position: 'absolute',
        right:10,
        top: 10
    },
>>>>>>> 840068a92d701e0e0a316029ff24b3e46708721c
    menuButton: {
        width: 40,
        height: 40,
        borderRadius: 150/2,
        backgroundColor: '#EBEBEB',
        alignItems: "center",
        justifyContent: 'center'
    },

    joinGame: {
        height: 89,
        borderRadius: 5,
        marginHorizontal: 17,
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
        backgroundColor: 'white',
        elevation: 5,
    },
    inputGameCode: {
        height: 29,
        marginTop: 10,
        marginHorizontal: 6,
        backgroundColor: 'white',
        borderColor: "#D1D1D1",
        borderWidth: 2,
        borderRadius: 5
    },
    joinGameButtonContainer: {
        height: 29,
        marginHorizontal: 6,
        backgroundColor: "#923DC7",
        marginTop: 10,
        borderRadius: 5,
        justifyContent: "center",
        alignItems: 'center'
    },
    joinGameButtonText: {
        color: 'white',
        fontSize: 14,
    },

    listQuizContainer: {
        height: 220
    },
    titleTopic: {
        fontSize: 14,
        fontWeight: 'bold',
        marginLeft: 13,
        marginVertical: 10
    }
});