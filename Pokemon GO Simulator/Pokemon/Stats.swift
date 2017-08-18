//
//  Stats.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/3/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

public struct Stats : Equatable {
    
    public var hp: Int
    
    public var attack: Int
    
    public var defense: Int
    
}

public func ==(lhs: Stats, rhs: Stats) -> Bool {
    return lhs.hp == rhs.hp
        && lhs.attack == rhs.attack
        && lhs.defense == rhs.defense
}
