//
//  PlanetarySystem.swift
//  TextAdventure
//
//  Created by Charles Martin Reed on 8/14/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import Foundation

class PlanetarySystem {
    let name: String
    let planets: [Planet]
    
    //MARK: - Computed Property
    var randomPlanet: Planet? {
        if planets.isEmpty {
            return nil
        } else {
            //return a random planet
            let index = Int(arc4random_uniform(UInt32(planets.count)))
            return planets[index]
        }
    }
    
    init(name: String, planets: [Planet]) {
        self.name = name
        self.planets = planets
    }
}
