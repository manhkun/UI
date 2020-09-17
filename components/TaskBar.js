import React, {Component} from 'react';
<<<<<<< HEAD
import {View, StyleSheet, Text, TouchableOpacity, Dimensions} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const screen = Dimensions.get('window');

=======
import {View, StyleSheet, Text, TouchableOpacity} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

>>>>>>> 840068a92d701e0e0a316029ff24b3e46708721c
export default class TaskBar extends Component {
    render(){
        return(
            <View style={styles.container}>
                <View style={styles.menuContainer}>
<<<<<<< HEAD
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-home" size={32}/>
                        <Text>Home</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-timer" size={32}/>
                        <Text>Activity</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-search" size={32}/>
                        <Text>Search</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-settings" size={32}/>
                        <Text>Setting</Text>
                    </TouchableOpacity>
                </View>
=======
                <TouchableOpacity style={styles.menuBarIcon}>
                    <Ionicons name="ios-home" size={32}/>
                    <Text>Home</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.menuBarIcon}>
                    <Ionicons name="ios-timer" size={32}/>
                    <Text>Activity</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.menuBarIcon}>
                    <Ionicons name="ios-search" size={32}/>
                    <Text>Search</Text>
                </TouchableOpacity>
                <TouchableOpacity style={styles.menuBarIcon}>
                    <Ionicons name="ios-settings" size={32}/>
                    <Text>Setting</Text>
                </TouchableOpacity>
            </View>
>>>>>>> 840068a92d701e0e0a316029ff24b3e46708721c
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
<<<<<<< HEAD
        position: 'absolute',
        bottom: 20,
        backgroundColor: 'transparent',
        width: screen.width,
        alignItems: "center"
=======
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: 'black',
        borderRadius: 45,
>>>>>>> 840068a92d701e0e0a316029ff24b3e46708721c
    },
    menuContainer: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        height: 60,
        width: 360,
        backgroundColor: 'white',
        borderRadius: 45,
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
        backgroundColor: 'white',
        elevation: 5,
        paddingHorizontal: 30,
    },
    menuBarIcon: {
        alignItems: "center",
    }
})