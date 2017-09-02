//
//  PokemonTemplateParser.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/9/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

private let pokemonSettingsKey = "pokemon_settings"

private let typeKey = "type"
private let type2Key = "type_2"

private let statsKey = "stats"
private let baseStaminaKey = "base_stamina"
private let baseAttackKey = "base_attack"
private let baseDefenseKey = "base_defense"

private let heightKey = "pokedex_height_m"
private let weightKey = "pokedex_weight_kg"
private let heightStdDevKey = "height_std_dev"
private let weightStdDevKey = "weight_std_dev"

private let familyIDKey = "family_id"
private let evolutionBranchKey = "evolution_branch"
private let evolutionKey = "evolution"

/// A type of error that can occur while parsing a species.
public enum SpeciesParseError : Error {
    
    case propertyNotFound(key: String)
    case invalidValue(key: String)
}

/// A type that can parse `Species` instances from `ItemTemplate`s.
public class PokémonTemplateParser {
    
    /// Parses a Pokémon species with the given `name` and `number` from `template`.
    func parseSpecies(from template: ItemTemplate, name: String, number: Int) throws -> Species {
        func parseInt(withKey key: String, from template: ItemTemplate) throws -> Int {
            guard let itemValue = template[key],
                case let .string(stringValue) = itemValue,
                let intValue = Int(stringValue) else {
                    throw SpeciesParseError.propertyNotFound(key: key)
            }
            return intValue
        }
        
        func parseDouble(withKey key: String, from template: ItemTemplate) throws -> Double {
            guard let itemValue = template[key],
                case let .string(stringValue) = itemValue,
                let doubleValue = Double(stringValue) else {
                    throw SpeciesParseError.propertyNotFound(key: key)
            }
            return doubleValue
        }
        
        func parseString(withKey key: String, from template: ItemTemplate) throws -> String {
            guard let itemValue = template[key],
                case let .string(stringValue) = itemValue else {
                    throw SpeciesParseError.propertyNotFound(key: key)
            }
            return stringValue
        }
        
        func parseTemplate(withKey key: String, from template: ItemTemplate) throws -> ItemTemplate {
            guard let itemValue = template[key],
                case let .template(templateValue) = itemValue else {
                    throw SpeciesParseError.propertyNotFound(key: key)
            }
            return templateValue
        }
        
        let settingsTemplate = try parseTemplate(withKey: pokemonSettingsKey, from: template)
        
        let statsTemplate = try parseTemplate(withKey: statsKey, from: settingsTemplate)
        let baseStamina = try parseInt(withKey: baseStaminaKey, from: statsTemplate)
        let baseAttack = try parseInt(withKey: baseAttackKey, from: statsTemplate)
        let baseDefense = try parseInt(withKey: baseDefenseKey, from: statsTemplate)
        let baseStats = Stats(hp: baseStamina, attack: baseAttack, defense: baseDefense)
        
        let height = try parseDouble(withKey: heightKey, from: settingsTemplate)
        let weight = try parseDouble(withKey: weightKey, from: settingsTemplate)
        let heightStdDev = try parseDouble(withKey: heightStdDevKey, from: settingsTemplate)
        let weightStdDev = try parseDouble(withKey: weightStdDevKey, from: settingsTemplate)
        
        let typeParser = TypeParser()
        let typeString = try parseString(withKey: typeKey, from: settingsTemplate)
        guard let type = typeParser.parseType(from: typeString) else {
            throw SpeciesParseError.invalidValue(key: typeKey)
        }
        var type2: Type?
        if let type2String = try? parseString(withKey: type2Key, from: settingsTemplate) {
            type2 = typeParser.parseType(from: type2String)
            if type2 == nil {
                throw SpeciesParseError.invalidValue(key: type2Key)
            }
        }
        
        let familyID = try parseString(withKey: familyIDKey, from: settingsTemplate)
        
        return Species(name: name, number: number, type: (type, type2), baseStats: baseStats, height: (height, heightStdDev), weight: (weight, weightStdDev), familyID: familyID)
    }
}
