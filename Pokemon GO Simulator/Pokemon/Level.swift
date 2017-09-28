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
    public var isPoweredUp: Bool
}
