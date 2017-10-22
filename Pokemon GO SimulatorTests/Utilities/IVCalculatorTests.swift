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
        var appraisal: Appraisal?
    }
    
    func testCalculatingIVs() {
        let calculator = IVCalculator()
        
        let alakazamBaseStats = Stats(hp: 110, attack: 271, defense: 194)
        
        var perfectAlakazam = MockIVCalculable(baseStats: alakazamBaseStats, cp: 2845, hp: 98, level: 39, appraisal: nil)
        do {
            let ivs = calculator.calculateIVs(of: perfectAlakazam)
            XCTAssertEqual(ivs.count, 1)
            XCTAssert(ivs.contains(Stats.maxIVs))
        }
        
        perfectAlakazam.appraisal = .best
        do {
            let ivs = calculator.calculateIVs(of: perfectAlakazam)
            XCTAssertEqual(ivs.count, 1)
            XCTAssert(ivs.contains(Stats.maxIVs))
        }
    }
    
}
