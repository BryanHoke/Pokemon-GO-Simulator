//
//  ItemTemplate.swift
//  Pokemon GO Simulator
//
//  Created by Bryan Hoke on 8/10/17.
//  Copyright © 2017 Bryan Hoke. All rights reserved.
//

import Foundation

// MARK: - ItemTemplate

/// A game structure as described by the GAME_MASTER.
public struct ItemTemplate : Equatable, ExpressibleByDictionaryLiteral {
    /// The internal Dictionary used for storing template keys and values.
    fileprivate var storage: [String: ItemTemplateValue] = [:]
    
    public init(dictionaryLiteral elements: (String, ItemTemplateValue)...) {
        for (key, value) in elements {
            self[key] = value
        }
    }
    
    public var count: Int {
        return storage.count
    }
    
    public subscript(key: String) -> ItemTemplateValue? {
        get {
            return storage[key]
        }
        set {
            // If there is an existing entry for key then a list should be formed
            if let existingValue = storage[key],
                let newValue = newValue,
                case let .string(newString) = newValue
            {
                switch existingValue {
                case let .string(existingString):
                    // Create a list from the existing and new strings
                    let newList = [existingString, newString]
                    storage[key] = .list(newList)
                case var .list(existingList):
                    // Append the new string to the existing list
                    existingList.append(newString)
                    storage[key] = .list(existingList)
                default:
                    // Other cases are not expected
                    break
                }
            }
            else {
                storage[key] = newValue
            }
        }
    }
}

public func ==(lhs: ItemTemplate, rhs: ItemTemplate) -> Bool {
    return lhs.storage == rhs.storage
}
//public typealias ItemTemplate = [String: ItemTemplateValue]

// MARK: - ItemTemplateValue

// TODO: Determine if quoted values should have a separate enum case

/// A value associated with an item template key.
public indirect enum ItemTemplateValue : Equatable, ExpressibleByStringLiteral, ExpressibleByDictionaryLiteral, ExpressibleByArrayLiteral {
    
    /// A string value.
    case string(String)
    
    /// A list of string values.
    case list([String])
    
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
    
    public init(arrayLiteral elements: String...) {
        self = .list(elements)
    }
}

public func ==(lhs: ItemTemplateValue, rhs: ItemTemplateValue) -> Bool {
    switch (lhs, rhs) {
    case let (.string(str1), .string(str2)):
        return str1 == str2
    case let (.template(template1), .template(template2)):
        return template1 == template2
    case let (.list(list1), .list(list2)):
        return list1 == list2
    default:
        return false
    }
}
