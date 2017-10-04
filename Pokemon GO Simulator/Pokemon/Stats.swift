//
//  Stats.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/3/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A Pokémon's stats.
public struct Stats : Hashable {
    
    /// The HP stat.
    public var hp: Int
    
    /// The attack stat.
    public var attack: Int
    
    /// The defense stat.
    public var defense: Int
    
    public var hashValue: Int {
        let prime = 31
        return hp * Int(pow(Double(prime), 2)) + attack * prime + defense
    }
}

public func ==(lhs: Stats, rhs: Stats) -> Bool {
    return lhs.hp == rhs.hp
        && lhs.attack == rhs.attack
        && lhs.defense == rhs.defense
}

public func +(lhs: Stats, rhs: Stats) -> Stats {
    return Stats(hp: lhs.hp + rhs.hp, attack: lhs.attack + rhs.attack, defense: lhs.defense + rhs.defense)
}
