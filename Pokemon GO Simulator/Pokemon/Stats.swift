//
//  Stats.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/3/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A Pokémon's stats.
///
/// This type can be used to represent both base stats and individual values (IVs).
public struct Stats : Hashable {
    
    /// An individual stat category.
    public enum Category : String {
        /// The HP category.
        case hp
        /// The attack category.
        case attack
        /// The defense category.
        case defense
        
        /// The set of all stat categories.
        public static let all: Set<Category> = [.hp, .attack, .defense]
    }
    
    /// The HP stat.
    public var hp: Int
    
    /// The attack stat.
    public var attack: Int
    
    /// The defense stat.
    public var defense: Int
    
    /// The IVs with the maximum value for every stat.
    public static let maxIVs = Stats(hp: 15, attack: 15, defense: 15)
    
    /// The IVs with a value of `0` for every stat.
    public static let zeroIVs = Stats(hp: 0, attack: 0, defense: 0)
    
    /// The set of all IVs.
    public static let allIVs: Set<Stats> = ivs(in: 0...15)
    
    /// The set of all IVs that can be found on Pokémon hatched from eggs.
    public static let eggIVs: Set<Stats> = ivs(in: 10...15)
    
    /// Returns the set of all IVs in the specified value range.
    public static func ivs(in range: CountableClosedRange<Int>) -> Set<Stats> {
        var ivs = Set<Stats>()
        for sta in range {
            for atk in range {
                for def in range {
                    ivs.insert(Stats(hp: sta, attack: atk, defense: def))
                }
            }
        }
        return ivs
    }
    
    /// Accesses the stat value of the specified `Category`.
    public subscript(category: Category) -> Int {
        get {
            switch category {
            case .hp: return hp
            case .attack: return attack
            case .defense: return defense
            }
        }
        set {
            switch category {
            case .hp: hp = newValue
            case .attack: attack = newValue
            case .defense: defense = newValue
            }
        }
    }
    
    public var hashValue: Int {
        let prime = 31
        return hp * Int(pow(Double(prime), 2)) + attack * prime + defense
    }
}

public func ==(lhs: Stats, rhs: Stats) -> Bool {
    return lhs.hp == rhs.hp
        && lhs.attack == rhs.attack
        && lhs.defense == rhs.defense
}

public func +(lhs: Stats, rhs: Stats) -> Stats {
    return Stats(hp: lhs.hp + rhs.hp, attack: lhs.attack + rhs.attack, defense: lhs.defense + rhs.defense)
}
