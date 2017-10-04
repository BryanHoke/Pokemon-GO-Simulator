//
//  Level.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 9/27/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A Pokémon level.
public struct Level {
    
    /// The ordinal value of the level.
    public var ordinal: Int
    
    /// Whether the Pokémon has been powered up at this level.
    public var isPoweredUp: Bool = false
    
    public init(ordinal: Int, isPoweredUp: Bool = false) {
        self.ordinal = ordinal
        self.isPoweredUp = isPoweredUp
    }
    
    /// Returns the level achieved by powering-up this level once.
    public var poweredUp: Level {
        var nextLevel = self
        nextLevel.powerUp()
        return nextLevel
    }
    
    /// Powers-up this level once.
    public mutating func powerUp() {
        if isPoweredUp {
            isPoweredUp = false
            ordinal += 1
        }
        else {
            isPoweredUp = true
        }
    }
}

extension Level : ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int) {
        ordinal = value
    }
}
