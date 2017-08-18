//
//  PokemonTemplateParser.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/9/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

private let pokemonSettingsKey = "pokemon_settings"
private let statsKey = "stats"
private let baseStaminaKey = "base_stamina"
private let baseAttackKey = "base_attack"
private let baseDefenseKey = "base_defense"

public class PokémonTemplateParser {
    
    func parseSpecies(from template: ItemTemplate, name: String, number: Int) -> Species {
        func parseInt(withKey key: String, from template: ItemTemplate) -> Int? {
            guard let itemValue = template[key],
                case let .string(stringValue) = itemValue,
                let intValue = Int(stringValue) else {
                    return nil
            }
            return intValue
        }
        
        guard let pokemonSettings = template[pokemonSettingsKey],
            case let .template(settingsTemplate) = pokemonSettings else {
                preconditionFailure("\(#function) \(pokemonSettingsKey) not found in template: \(template)")
        }
        
        guard let stats = settingsTemplate[statsKey],
            case let .template(statsTemplate) = stats else {
                preconditionFailure("\(#function) \(statsKey) not found in template: \(settingsTemplate)")
        }
        
        guard let baseStamina = parseInt(withKey: baseStaminaKey, from: statsTemplate) else {
            preconditionFailure("\(#function) \(baseStaminaKey) not found in template: \(settingsTemplate)")
        }
        
        guard let baseAttack = parseInt(withKey: baseAttackKey, from: statsTemplate) else {
            preconditionFailure("\(#function) \(baseAttackKey) not found in template: \(settingsTemplate)")
        }
        
        guard let baseDefense = parseInt(withKey: baseDefenseKey, from: statsTemplate) else {
            preconditionFailure("\(#function) \(baseDefenseKey) not found in template: \(settingsTemplate)")
        }
        
        let baseStats = Stats(hp: baseStamina, attack: baseAttack, defense: baseDefense)
        return Species(name: name, number: number, baseStats: baseStats)
    }
}
