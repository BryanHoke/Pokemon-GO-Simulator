//
//  StatsTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 10/3/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class StatsTests: XCTestCase {
    
    func testEggIVs() {
        let eggIVs = Stats.eggIVs
        XCTAssertEqual(eggIVs.count, 216)
    }
    
    func testAllIVs() {
        let allIVs = Stats.allIVs
        XCTAssertEqual(allIVs.count, 4096)
    }
    
}
