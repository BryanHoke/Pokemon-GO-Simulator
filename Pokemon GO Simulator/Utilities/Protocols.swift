//
//  Protocols.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 9/28/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

// MARK: - Calculating CP

/// A type for which CP (combat power) can be calculated.
protocol CPCalculable {
    
    /// A `Level` used for calculating CP.
    var level: Level { get }
    
    /// The `Stats` used for calculating CP.
    var stats: Stats { get }
}

/// A type which can calculate the CP (combat power) of `CPCalculable` instances.
protocol CPCalculating {
    
    /// Calculates the CP of a `CPCalculable` instance.
    func calculateCP(of subject: CPCalculable) -> Int
}

// MARK: - Calculating IVs

/// A type for which individual values (IVs) can be calculated.
protocol IVCalculable {
    
    /// The base stats used for calculating IVs.
    var baseStats: Stats { get }
    
    /// The CP used for calculating IVs.
    var cp: Int { get }
    
    /// The HP used for calculating IVs.
    var hp: Int { get }
    
    /// The `Level` used for calcuating IVs.
    var level: Level { get }
    
    /// The stat `Appraisal` used for calculating IVs.
    var appraisal: Appraisal? { get }
}

/// A type which can calculate the individual values (IVs) of `IVCalculable` instances.
protocol IVCalculating {
    
    /// Returns the set of all possible IVs for the specified `IVCalculable` instance.
    func calculateIVs(of subject: IVCalculable) -> Set<Stats>
}

// MARK: - Appraising stats

/// A type that can appraise `Stats`.
public protocol StatAppraising {
    
    /// Returns the determined `Appraisal` of the specified `Stats`.
    func appraise(_ stats: Stats) -> Appraisal
}
