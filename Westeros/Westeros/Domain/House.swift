//
//  House.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Words = String
typealias Members = Set<Person>

final class House {
    // MARK: Properties
    let name: String
    private let _named: Name?
    let sigil: Sigil
    let words: Words
    let wikiURL: URL
    private var _members: Members
    
    var named: Name {
        return _named ?? Name.sinAsignar
    }
    
    // MARK: Initialization
    init(name: String, sigil: Sigil, words: Words, wikiURL: URL, named: Name? = nil) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = wikiURL
        _named = named
        _members = Members()
    }
}

enum Name : String {
    case stark
    case lannister
    case targaryen
    case sinAsignar
}

extension House {
    var count: Int {
        return _members.count
    }
    
    var sortedMembers: [Person] {
        return _members.sorted()
    }
    
    func add(person: Person) {
        guard person.house == self else { return }
        _members.insert(person)
    }
    
    // Función variádica
    func add(persons: Person...) {
//        for person in persons {
//            add(person: person)
//        }
        persons.forEach { add(person: $0) }
    }
}

extension House {
    var proxyForEquality: String {
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparison: String {
        return name
    }
}

extension House: Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension House: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension House: Comparable {
    static func < (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
