//
//  Moves.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/4/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

public struct FastMove : Hashable {
    public let name: String
    public var power: Int
    public var type: Type
    public var cooldown: TimeInterval
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

public struct ChargedMove : Hashable {
    public let name: String
    public var power: Int
    public var type: Type
    public var cooldown: TimeInterval
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
