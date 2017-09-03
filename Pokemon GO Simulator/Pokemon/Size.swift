//
//  Size.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 9/2/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A Pokémon's size.
public struct Size : Equatable {
    
    /// The Pokémon's height (in meters).
    public var height: Double
    
    /// The Pokémon's weight (in kilograms).
    public var weight: Double
}

public func ==(lhs: Size, rhs: Size) -> Bool {
    return lhs.height == rhs.height
        && lhs.weight == rhs.weight
}

/// The size distribution of a Pokémon species.
public struct SizeDistribution : Equatable {
    /// The statistics used to describe the distribution of an individual size attribute.
    public struct Statistics : Equatable {
        /// The distribution mean.
        public var mean: Double
        /// The distribution standard deviation.
        public var standardDeviation: Double
    }
    
    /// The species' height distribution.
    public var height: Statistics
    
    /// The species' weight distribution.
    public var weight: Statistics
}

public func ==(lhs: SizeDistribution, rhs: SizeDistribution) -> Bool {
    return lhs.height == rhs.height
        && lhs.weight == rhs.weight
}

public func ==(lhs: SizeDistribution.Statistics, rhs: SizeDistribution.Statistics) -> Bool {
    return lhs.mean == rhs.mean
        && lhs.standardDeviation == rhs.standardDeviation
}
