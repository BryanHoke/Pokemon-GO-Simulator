//
//  Pokemon.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/3/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// An individual Pokémon.
public struct Pokémon {
    
    /// The species to which this Pokémon belongs.
    public let species: Species
    
    /// The Pokémon's current stats.
    public private(set) var stats: Stats
    
    /// The Pokémon's level.
    public var level: Level
    
    /// The Pokémon's current HP.
    public var currentHP: Int
    
    /// The Pokémon's moveset.
    public var moveset: Moveset
    
    /// The Pokémon's nickname.
    public var nickname: String?
    
    /// The Pokémon's name.
    public var name: String {
        return nickname ?? species.name
    }
    
    /// The Pokémon's individual values.
    public var ivs: Stats
}
