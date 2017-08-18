//
//  ItemTemplate.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/10/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

/// A game structure as described by the GAME_MASTER.
public typealias ItemTemplate = [String: ItemTemplateValue]

// TODO: Determine if quoted values should have a separate enum case

/// A value associated with an item template key.
public indirect enum ItemTemplateValue : Equatable, ExpressibleByStringLiteral, ExpressibleByDictionaryLiteral {
    
    /// A string value.
    case string(String)
    
    /// A nested item template value.
    case template(ItemTemplate)
    
    public init(stringLiteral value: String) {
        self = .string(value)
    }
    
    public init(dictionaryLiteral elements: (String, ItemTemplateValue)...) {
        var template = ItemTemplate()
        for (key, value) in elements {
            template[key] = value
        }
        self = .template(template)
    }
}

public func ==(lhs: ItemTemplateValue, rhs: ItemTemplateValue) -> Bool {
    switch (lhs, rhs) {
    case let (.string(str1), .string(str2)):
        return str1 == str2
    case let (.template(template1), .template(template2)):
        return template1 == template2
    default:
        return false
    }
}
