//
//  GameMasterScannerTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 8/10/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class GameMasterScannerTests: XCTestCase {
    
    let scanner = GameMasterScanner()
    
    func testScanningGameMaster() {
        let itemTemplates = scanner.scanGameMaster(GameMasterExamples.example1)
        XCTAssertEqual(itemTemplates.count, 2)
        print(itemTemplates[0].count)
        print(itemTemplates[1].count)
        XCTAssertEqual(itemTemplates[0], ItemTemplateExamples.bulbasaur)
        XCTAssertEqual(itemTemplates[1], ItemTemplateExamples.wrap)
    }
    
}
