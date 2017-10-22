//
//  Appraisal.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 10/22/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// An appraisal of a Pokémon's stats.
public struct Appraisal {
    
    /// A rating category given by the `Appraisal`.
    public enum Grade {
        /// The best rating.
        case a
        /// The second-best rating.
        case b
        /// The third-best rating.
        case c
        /// The worst rating.
        case d
    }
    
    /// The overall rating of the Pokémon's stats.
    public var overall: Grade
    
    /// The Pokémon's best stat(s).
    ///
    /// The value of this property should not be the empty set.
    /// In the case of a tie, the value should be the set of all the tied stats.
    public var best: Set<Stats.Category>
    
    /// The rating of the Pokémon's best stat(s).
    public var stat: Grade
    
    /// The best `Appraisal` that can be given.
    public static let best = Appraisal(overall: .a, best: [.hp, .attack, .defense], stat: .a)
}
