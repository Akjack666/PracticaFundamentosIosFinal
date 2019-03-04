//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 06/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros
class RepositoryTests: XCTestCase {

    var houses: [House]!
    var seasons: [Season]!
    
    override func setUp() {
        houses = Repository.local.houses
        seasons = Repository.local.seasons
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalRepositoryExistence() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHouseExistence() {
        XCTAssertNotNil(houses)
    }
    
    func testLocalRepositorySeasonsExistence() {
        XCTAssertNotNil(seasons)
    }
    
    func testLocalRepository_HouseCount() {
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepository_SeasonCount() {
        XCTAssertEqual(seasons.count, 7)
    }

    func testLocalRepository_ReturnsSortedArrayOfHouses() {
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testLocalRepository_ReturnsSortedArrayOfSeasons() {
        XCTAssertEqual(seasons, seasons.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInsensitively() {
        let stark = Repository.local.house(named: "stArk")
        XCTAssertNotNil(stark)
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcodig = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcodig)
    }
    
    
    
    func testLocalRepositoryReturnsSeasonsByNameCaseInsensitively() {
        let seasonOne = Repository.local.season(named: "SeAsOn 1")
        XCTAssertNotNil(seasonOne)
        XCTAssertEqual(seasonOne?.name, "Season 1")
        
        let keepcodig = Repository.local.season(named: "Keepcoding")
        XCTAssertNil(keepcodig)
    }
    
    
    // given-when-then
    func testLocalRepository_HousesFilteredBy_ReturnsTheCorrectValue() {
//        let filtered = Repository.local.houses {
//            $0.count == 1
//        }
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })

        XCTAssertEqual(filtered.count, 1)
    }
    
    
    func testLocalRepository_SeasonsFilteredBy_ReturnsTheCorrectValue() {
        
        
        // Filtramos las temporadas que tendran 2 capitulos, que nos dara como resultado 7
        
        let filtered = Repository.local.seasons(filteredBy: { $0.count == 2 })
        
        XCTAssertEqual(filtered.count, 7)
    }
}
