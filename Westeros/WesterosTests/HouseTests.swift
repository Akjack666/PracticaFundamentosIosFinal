//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 31/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Asignaríamos los objectos a nil
    }

    // Given - When - Then
    func testHouseExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: UIImage(), description: "León Rampante")
        XCTAssertNotNil(lannisterSigil)
    }
}
