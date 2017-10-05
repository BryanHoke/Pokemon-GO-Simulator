//
//  CPMultipliersTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 9/29/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class CPMultipliersTests: XCTestCase {
    
    func testValueForLevel() {
        let multipliers = CPMultipliers()
        XCTAssertEqual(multipliers.values.count, 40)
        XCTAssertEqual(multipliers[1], 0.094)
        XCTAssertEqual(multipliers[2], 0.16639787)
        XCTAssertEqual(multipliers[39], 0.784637)
        XCTAssertEqual(multipliers[40], 0.7903)
        
        XCTAssertEqual(multipliers[Level(ordinal: 1, isPoweredUp: true)], 0.135137432158038, accuracy: 1e-15)
        XCTAssertEqual(multipliers[Level(ordinal: 38, isPoweredUp: true)], 0.781790077575676, accuracy: 1e-15)
    }
    
}
