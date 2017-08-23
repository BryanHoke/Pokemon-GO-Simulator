//
//  TypeParser.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/22/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A type that can parse Pokémon `Type` values from game-master-formatted strings.
///
/// The input strings are expected to be of the form "POKEMON_TYPE_<TYPE>".
/// For example, `Type.water` would be parsed from "POKEMON_TYPE_WATER".
public struct TypeParser {
    
    /// Returns the type parsed from `text`, or `nil` if no type can be parsed.
    public func parseType(from text: String) -> Type? {
        let tokens = text.components(separatedBy: "_")
        guard tokens.count == 3 else {
            return nil
        }
        return Type(rawValue: tokens[2].lowercased())
    }
}
