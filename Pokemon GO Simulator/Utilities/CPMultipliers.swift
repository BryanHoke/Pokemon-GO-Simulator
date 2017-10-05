//
//  CPMultipliers.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 9/29/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

public struct CPMultipliers {
    
    public var values = CPMultipliers.officialValues
    
    public func value(for level: Level) -> Double {
        func value(for levelOrdinal: Int) -> Double {
            guard levelOrdinal > 0 else {
                return values[0]
            }
            guard levelOrdinal <= 40 else {
                return values[39]
            }
            return values[levelOrdinal - 1]
        }
        
        let cpm: Double
        let levelCPM = value(for: level.ordinal)
        
        if level.isPoweredUp {
            let nextLevelCPM = value(for: level.ordinal + 1)
            let cpmStep = (pow(nextLevelCPM, 2) - pow(levelCPM, 2)) / 2
            cpm = sqrt(pow(levelCPM, 2) + cpmStep)
        }
        else {
            cpm = levelCPM
        }
        
        return cpm
    }
    
    public subscript(_ level: Level) -> Double {
        return value(for: level)
    }
    
    public static let officialValues: [Double] = [
        0.094,
        0.16639787,
        0.21573247,
        0.25572005,
        0.29024988,
        0.3210876,
        0.34921268,
        0.37523559,
        0.39956728,
        0.4225,
        0.44310755,
        0.46279839,
        0.48168495,
        0.49985844,
        0.51739395,
        0.53435433,
        0.55079269,
        0.56675452,
        0.58227891,
        0.5974,
        0.61215729,
        0.62656713,
        0.64065295,
        0.65443563,
        0.667934,
        0.68116492,
        0.69414365,
        0.70688421,
        0.71939909,
        0.7317,
        0.73776948,
        0.74378943,
        0.74976104,
        0.75568551,
        0.76156384,
        0.76739717,
        0.7731865,
        0.77893275,
        0.784637,
        0.7903
    ]
}
