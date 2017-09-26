//
//  ItemTemplateTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 9/2/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class ItemTemplateTests: XCTestCase {
    
    func testInitWithDictionaryLiteral() {
        let key = "quick_moves"
        let value1 = "VINE_WHIP_FAST"
        let value2 = "TACKLE_FAST"
        
        var template: ItemTemplate = [
            key: .string(value1),
            key: .string(value2)
        ]
        
        XCTAssertEqual(template[key], [value1, value2])
    }
    
    func testSubscript() {
        var template = ItemTemplate()
        
        do {
            let key = "quick_moves"
            let value1 = "VINE_WHIP_FAST"
            let value2 = "TACKLE_FAST"
            
            template[key] = .string(value1)
            template[key] = .string(value2)
            
            XCTAssertEqual(template[key], [value1, value2])
        }
        
        do {
            let key = "cinematic_moves"
            let value1 = "SLUDGE_BOMB"
            let value2 = "SEED_BOMB"
            let value3 = "POWER_WHIP"
            
            template[key] = .string(value1)
            template[key] = .string(value2)
            template[key] = .string(value3)
            
            XCTAssertEqual(template[key], [value1, value2, value3])
        }
        
        do {
            let key = "pokemon_id"
            let value: ItemTemplateValue = "BULBASAUR"
            
            template[key] = value
            
            XCTAssertEqual(template[key], value)
        }
    }
}
