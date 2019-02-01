//
//  PersonTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 31/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {

    var starkHouse: House!
    var starkSigil: Sigil!
    // 1- Le damos un valor por defecto
    // 2- La creo de tipo opcional, para que pueda ser nil
    
    override func setUp() {
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPersonExistence() {
        let character = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(character)
    }
    
    func testPersonHasFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
}
