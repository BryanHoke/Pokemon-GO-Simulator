//
//  TemplateIDParser.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/9/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

private let templateIDKey = "template_id"
private let pokemonTemplateID = "POKEMON"
private let moveTemplateID = "MOVE"
private let typeTemplateID = "POKEMON_TYPE"

/// Parses `TemplateType` values from template ID strings.
public class TemplateIDParser {
    
    typealias My = TemplateIDParser
    
    static let gameplayTemplateIDPrefix = try! NSRegularExpression(pattern: "^V\\d{4}", options: [])
    
    public func templateType(for template: ItemTemplate) -> TemplateType? {
        guard let templateIDValue = template[templateIDKey],
            case let .string(templateIDString) = templateIDValue else {
                return nil
        }
        let templateID = templateIDString.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return parseTemplateType(from: templateID)
    }
    
    /// Parses the template type from a string (a template ID value) and returns the result.
    public func parseTemplateType(from templateID: String) -> TemplateType {
        if My.gameplayTemplateIDPrefix.firstMatch(in: templateID, options: [], range: NSMakeRange(0, templateID.count)) != nil {
            let parts = templateID.components(separatedBy: "_")
            let codePart = parts[0]
            let numberSlice = String(codePart[codePart.index(after: codePart.startIndex)...])
            guard let number = Int(numberSlice) else {
                preconditionFailure("\(#function) `number` not found from \(codePart)")
            }
            let typePart = parts[1]
            if typePart == pokemonTemplateID {
                return .pokemon(name: parts[2], number: number)
            }
            else if typePart == moveTemplateID {
                return .move(name: parts[2])
            }
            else {
                return .other
            }
        }
        else if templateID.hasPrefix(typeTemplateID) {
            let parts = templateID.components(separatedBy: "_")
            return .type(name: parts[2])
        }
        else {
            return .other
        }
    }
}

/// A type of template.
public enum TemplateType {
    
    /// A Pokémon template.
    case pokemon(name: String, number: Int)
    
    /// A move template.
    case move(name: String)
    
    /// A Pokémon type template.
    case type(name: String)
    
    /// Some other type of template.
    case other
}
