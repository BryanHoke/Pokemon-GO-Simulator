//
//  CPCalculatorTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 9/28/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class CPCalculatorTests: XCTestCase {
    
    struct MockCPCalculable : CPCalculable {
        var level: Level
        var stats: Stats
    }
    
    let alakazamBaseStats = Stats(hp: 110, attack: 271, defense: 194)
    let espeonBaseStats = Stats(hp: 130, attack: 261, defense: 194)
    let laprasBaseStats = Stats(hp: 260, attack: 165, defense: 180)
    let dittoBaseStats = Stats(hp: 96, attack: 91, defense: 91)
    
    func testComputingCP() {
        let calculator = CPCalculator()
        let perfectIVs = Stats(hp: 15, attack: 15, defense: 15)
        // (Level, Stats, expected CP)
        let testValues: [(Level, Stats, Int)] = [
            (39, alakazamBaseStats + perfectIVs, 2845),
            (39, espeonBaseStats + perfectIVs, 2958),
            (39, laprasBaseStats + perfectIVs, 2566),
            (13, dittoBaseStats + perfectIVs, 266)
        ]
        
        for example in testValues {
            let calculable = MockCPCalculable(level: example.0, stats: example.1)
            let calculatedCP = calculator.calculateCP(of: calculable)
            XCTAssertEqual(calculatedCP, example.2)
        }
    }
}
