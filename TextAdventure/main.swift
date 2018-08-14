//
//  main.swift
//  TextAdventure
//
//  Created by Charles Martin Reed on 8/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import Foundation

let systemName = "Solar System"
let planetData = ["Mercury": "A very hot planet, closest to the sun.",
                  "Venus": "So cloudy!",
                  "Earth": "There is something very familiar about this planet.",
                  "Mars": "Also known as the \"Red Planet\"",
                  "Jupiter": "A gas giant, with a noticeable red spot.",
                  "Saturn": "This planet has beautiful rings around it.",
                  "Uranus": "Strangely, this planet rotates around on its side.",
                  "Neptune": "A very cold planet, furthest from the sun."
                    ]

//create an array of planet objects, using the data from the planetData array
let planets = planetData.map {name, description in Planet(name: name, description: description)}

let solarSystem = PlanetarySystem(name: systemName, planets: planets)

//creating our adventure to start the game
let adventure = SpaceAdventure(planetarySystem: solarSystem)
adventure.start()
