//
//  Person.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

final class Person {
    
    // MARK: Properties
    let name: String
    private let _alias: String?
    let house: House
    
    // propiedades computada
    var alias: String {
        return _alias ?? ""
    }
    
    // MARK: Initialization
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
}
