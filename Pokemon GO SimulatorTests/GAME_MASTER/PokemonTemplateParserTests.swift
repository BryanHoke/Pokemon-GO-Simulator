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
            "pokemon_settings": .template([
                "pokemon_id": "BULBASAUR",
                "type": "POKEMON_TYPE_GRASS",
                "type_2": "POKEMON_TYPE_POISON",
                "stats": .template([
                    "base_stamina": "90",
                    "base_attack": "118",
                    "base_defense": "118"
                    ]),
                "pokedex_height_m": "0.7",
                "pokedex_weight_kg": "6.9",
                "height_std_dev": "0.0875",
                "weight_std_dev": "0.8625",
                "family_id": "FAMILY_BULBASAUR"
            ])
        ]
        let name = "BULBASAUR"
        let number = 1
        
        do {
            let species = try parser.parseSpecies(from: template, name: name, number: number)
            XCTAssertEqual(species.name, "BULBASAUR")
            XCTAssertEqual(species.number, 1)
            XCTAssertEqual(species.type.0, .grass)
            XCTAssertEqual(species.type.1, .poison)
            XCTAssertEqual(species.baseStats, Stats(hp: 90, attack: 118, defense: 118))
            XCTAssertEqual(species.sizeDistribution.height.mean, 0.7)
            XCTAssertEqual(species.sizeDistribution.height.standardDeviation, 0.0875)
            XCTAssertEqual(species.sizeDistribution.weight.mean, 6.9)
            XCTAssertEqual(species.sizeDistribution.weight.standardDeviation, 0.8625)
            XCTAssertEqual(species.familyID, "FAMILY_BULBASAUR")
        }
        catch let error {
            XCTFail("Parsing of species failed with error: \(error)")
        }
    }
    
}
