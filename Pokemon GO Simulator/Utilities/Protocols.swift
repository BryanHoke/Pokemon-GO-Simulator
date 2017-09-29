//
//  Protocols.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 9/28/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A type for which CP (combat power) can be calculated.
protocol CPCalculable {
    
    /// A `Level` used for calculating CP.
    var level: Level { get }
    
    /// The `Stats` used for calculating CP.
    var stats: Stats { get }
}
