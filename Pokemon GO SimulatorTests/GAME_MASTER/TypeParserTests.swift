//
//  TypeParserTests.swift
//  Pokemon GO SimulatorTests
//
//  Created by Bryan Hoke on 8/23/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import XCTest

class TypeParserTests: XCTestCase {
    
    let solutions: [String : Type] = [
        "POKEMON_TYPE_BUG" : .bug,
        "POKEMON_TYPE_DARK" : .dark,
        "POKEMON_TYPE_DRAGON" : .dragon,
        "POKEMON_TYPE_ELECTRIC" : .electric,
        "POKEMON_TYPE_FAIRY" : .fairy,
        "POKEMON_TYPE_FIGHTING" : .fighting,
        "POKEMON_TYPE_FIRE" : .fire,
        "POKEMON_TYPE_FLYING" : .flying,
        "POKEMON_TYPE_GHOST" : .ghost,
        "POKEMON_TYPE_GRASS" : .grass,
        "POKEMON_TYPE_GROUND" : .ground,
        "POKEMON_TYPE_ICE" : .ice,
        "POKEMON_TYPE_NORMAL" : .normal,
        "POKEMON_TYPE_POISON" : .poison,
        "POKEMON_TYPE_PSYCHIC" : .psychic,
        "POKEMON_TYPE_ROCK" : .rock,
        "POKEMON_TYPE_STEEL" : .steel,
        "POKEMON_TYPE_WATER" : .water
    ]
    
    func testExample() {
        let parser = TypeParser()
        for (typeString, expectedType) in solutions {
            guard let parsedType = parser.parseType(from: typeString) else {
                XCTFail("Unable to parse type from \"\(typeString)\"; expected \(expectedType)")
                continue
            }
            XCTAssertEqual(parsedType, expectedType)
        }
    }
    
}
