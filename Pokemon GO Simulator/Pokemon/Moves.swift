//
//  Moves.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/4/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A fast move that also builds energy.
public struct FastMove : Hashable {
    
    /// The move's name
    public let name: String
    
    /// The move's power.
    public var power: Int
    
    /// The move's type.
    public var type: Type
    
    /// The amount of time it takes for the move to complete.
    public var cooldown: TimeInterval
    
    /// The amount of energy gained from using the move.
    public var energyGain: Int
    
    public var hashValue: Int {
        return name.hashValue
    }
}

public func ==(lhs: FastMove, rhs: FastMove) -> Bool {
    return lhs.name == rhs.name
    && lhs.power == rhs.power
    && lhs.type == rhs.type
    && lhs.cooldown == rhs.cooldown
    && lhs.energyGain == rhs.energyGain
}

/// A move that requires the consumption of energy to use.
public struct ChargedMove : Hashable {
    
    /// The move's name.
    public let name: String
    
    /// The move's power.
    public var power: Int
    
    /// The move's type.
    public var type: Type
    
    /// The amount of time it takes for the move to complete.
    public var cooldown: TimeInterval
    
    /// The amount of energy it costs to use the move.
    public var energyCost: Int
    
    public var hashValue: Int {
        return name.hashValue
    }
}

public func ==(lhs: ChargedMove, rhs: ChargedMove) -> Bool {
    return lhs.name == rhs.name
        && lhs.power == rhs.power
        && lhs.type == rhs.type
        && lhs.cooldown == rhs.cooldown
        && lhs.energyCost == rhs.energyCost
}

/// A Pokémon moveset.
public struct Moveset {
    
    /// The fast move.
    public var fast: FastMove
    
    /// The charged move.
    public var charged: ChargedMove
}
