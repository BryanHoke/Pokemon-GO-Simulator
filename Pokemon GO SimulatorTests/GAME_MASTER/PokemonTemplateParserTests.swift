//
//  PokemonTemplateParserTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 8/10/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class PokemonTemplateParserTests: XCTestCase {
    
    let parser = PokémonTemplateParser()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParsingPokemon() {
        let template: ItemTemplate = [
            "pokemon_settings" : .template([
                "stats" : .template([
                    "base_stamina" : .string("90"),
                    "base_attack" : .string("118"),
                    "base_defense" : .string("118")
                    ])
            ])
        ]
        let name = "BULBASAUR"
        let number = 1
        
        let stats = Stats(hp: 90, attack: 118, defense: 118)
        
        let species = parser.parseSpecies(from: template, name: name, number: number)
        XCTAssertEqual(species.name, "BULBASAUR")
        XCTAssertEqual(species.number, 1)
        XCTAssertEqual(species.baseStats, stats)
    }
    
}
