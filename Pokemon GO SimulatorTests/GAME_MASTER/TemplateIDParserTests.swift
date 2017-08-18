//
//  TemplateIDParserTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 8/9/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class TemplateIDParserTests: XCTestCase {
    
    let parser = TemplateIDParser()
    
    func testParsingPokemon() {
        let templateID = "V0001_POKEMON_BULBASAUR"
        let type = parser.parseTemplateType(from: templateID)
        if case let .pokemon(name, number) = type {
            XCTAssertEqual(name, "BULBASAUR")
            XCTAssertEqual(number, 1)
        }
        else {
            XCTFail("Expected \(type) to be of value TemplateType.pokemon")
        }
    }
    
    func testParsingMove() {
        let templateID = "V0013_MOVE_WRAP"
        let type = parser.parseTemplateType(from: templateID)
        if case let .move(name) = type {
            XCTAssertEqual(name, "WRAP")
        } else {
            XCTFail("Expected \(type) to be of value TemplateType.move")
        }
    }
    
    func testParsingPokemonType() {
        let templateID = "POKEMON_TYPE_STEEL"
        let type = parser.parseTemplateType(from: templateID)
        if case let .type(name) = type {
            XCTAssertEqual(name, "STEEL")
        }
        else {
            XCTFail("Expected \(type) to be of value TemplateType.type")
        }
    }
}
