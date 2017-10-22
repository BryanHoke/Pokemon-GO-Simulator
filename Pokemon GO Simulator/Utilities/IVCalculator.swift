//
//  IVCalculator.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 10/4/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

public struct IVCalculator : IVCalculating {
    
    private struct CPCaclulable : CPCalculable {
        var level: Level
        var stats: Stats
    }
    
    func calculateIVs(of subject: IVCalculable) -> Set<Stats> {
        var possibleIVs = Set<Stats>()
        let cpCalculator = CPCalculator()
        for ivs in Stats.allIVs {
            let stats = subject.baseStats + ivs
            let cpCalculable = IVCalculator.CPCaclulable(level: subject.level, stats: stats)
            let calculatedCP = cpCalculator.calculateCP(of: cpCalculable)
            if calculatedCP == subject.cp {
                possibleIVs.insert(ivs)
            }
        }
        return possibleIVs
    }
    
}
