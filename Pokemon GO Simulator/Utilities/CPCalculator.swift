//
//  CPCalculator.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 9/28/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

public struct CPCalculator : CPCalculating {
    
    public static let minimumCP = 10
    
    var cpMultipliers = CPMultipliers()
    
    func calculateCP(of subject: CPCalculable) -> Int {
        let cpm = cpMultipliers[subject.level]
        let stats = subject.stats
        let stamina = Double(stats.hp)
        let attack = Double(stats.attack)
        let defense = Double(stats.defense)
        let rawCP = (attack * sqrt(defense * stamina) * pow(cpm, 2)) / 10
        let roundedCP = Int(floor(rawCP))
        return max(roundedCP, CPCalculator.minimumCP)
    }
}
