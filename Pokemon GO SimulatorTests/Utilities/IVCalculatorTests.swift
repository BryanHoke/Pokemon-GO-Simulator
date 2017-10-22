//
//  IVCalculatorTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 10/4/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class IVCalculatorTests: XCTestCase {
    
    struct MockIVCalculable : IVCalculable {
        var baseStats: Stats
        var cp: Int
        var hp: Int
        var level: Level
    }
    
    func testCalculatingIVs() {
        let calculator = IVCalculator()
        
        let alakazamBaseStats = Stats(hp: 110, attack: 271, defense: 194)
        
        do {
            let alakazam = MockIVCalculable(baseStats: alakazamBaseStats, cp: 2845, hp: 98, level: 39)
            let ivs = calculator.calculateIVs(of: alakazam)
            XCTAssertEqual(ivs.count, 1)
            XCTAssert(ivs.contains(Stats.maxIVs))
        }
    }
    
}
