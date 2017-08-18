//
//  Species.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/3/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A species of Pokémon.
public class Species {
    
    /// The species' name.
    public let name: String
    
    /// The species' Pokédex number.
    public let number: Int
    
    /// The species' type(s).
    public let type: (Type, Type?)
    
    /// The species' base stats.
    public let baseStats: Stats
    
    /// The mean and standard deviation of the species' height (in meters).
    public let height: (mean: Double, standardDeviation: Double)
    
    /// The mean and standard deviation of the species' weight (in kilograms).
    public let weight: (mean: Double, standardDeviation: Double)
    
    /// The ID of the family to which the species belongs.
    public let familyID: String
    
    /// The fast moves learned by the species.
    public var fastMoves: Set<FastMove> = []
    
    /// The charged moves learned by the species.
    public var chargedMoves: Set<ChargedMove> = []
    
    /// The names of the species into which this species can evolve.
    public var evolutionBranches: Set<String> = []
    
    public init(name: String, number: Int, type: (Type, Type?), baseStats: Stats, height: (mean: Double, standardDeviation: Double), weight: (mean: Double, standardDeviation: Double), familyID: String) {
        self.name = name
        self.number = number
        self.type = type
        self.baseStats = baseStats
        self.height = height
        self.weight = weight
        self.familyID = familyID
    }
}
