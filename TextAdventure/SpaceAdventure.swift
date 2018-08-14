//
//  SpaceAdventure.swift
//  TextAdventure
//
//  Created by Charles Martin Reed on 8/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import Foundation

//this is where the magic of our game occurs
class SpaceAdventure {
    let planetarySystem: PlanetarySystem
    
    init(planetarySystem: PlanetarySystem) {
        self.planetarySystem = planetarySystem
    }
    
    //ENCAPSULATION - only needs to be handled in this class file
    private func displayIntroduction() {
        print("Welcome to the \(planetarySystem.name)")
        print("There are \(planetarySystem.planets.count) planets to explore")
    }
    
    private func responseToPrompt(prompt: String) -> String {
        //prints prompt, waits for user input
        print(prompt)
        return getUserInput()
    }
    
    private func greetAdventure() {
        let name = responseToPrompt(prompt: "What is your name?")
        print("Nice to meet you, \(name). My Name is Eliza, I'm an old friend of Siri!")
    }
    
    private func visit(planetName: String) {
        print("Traveling to \(planetName) ...")
        
        for planet in planetarySystem.planets {
            if planetName == planet.name {
                print("Arrived at \(planet.name). \(planet.description)")
            }
        }
    }
    
    private func determineDestination() {
        var decision = ""
        
        //happens before the player chooses to answer, and from there we use their input to determine which branch we take.
        while !(decision == "Y" || decision == "N") {
            decision = responseToPrompt(prompt: "Shall I randomly choose a planet to visit? Enter Y or N")
            
            if decision == "Y" {
                //because randomPlanet is an optional, we need to handle this gracefully
                if let planet = planetarySystem.randomPlanet {
                    visit(planetName: planet.name)
                } else {
                    print("Sorry, but there are no planets in this system.")
                }
                
            } else if decision == "N" {
                let planetName = responseToPrompt(prompt: "OK, name the planet you would like to visit.")
//                for planet in planets {
//                    if planetName == planet.name {
                        visit(planetName: planetName)
//                    } else {
//                        print("Sorry, but I don't recognize that planet.")
//                        determineDestination()
                    }
                else {
                    print("Sorry, please try again")
                }
        //offer user the ability to restart and travel again
        }
        restart()
    }
    
    func start() {
        displayIntroduction()
        greetAdventure()
        if !planetarySystem.planets.isEmpty {
            print("Let's go on an adventure!")
            determineDestination()
        }
    }
    
    func restart() {
        var response = ""
        
        response = responseToPrompt(prompt: "That was fun! Shall we visit another planet?")
        
        if response == "Y" {
            displayIntroduction()
            determineDestination()
        } else if response == "N" {
            print("OK, See you next time!")
            exit(0) //terminates the command line app
        }
    }
}

