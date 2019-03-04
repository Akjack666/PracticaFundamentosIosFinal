//
//  EpisodeTest.swift
//  WesterosTests
//
//  Created by g5 on 13/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    var episodioUno: Episode!
    var episodio1: Episode!
    var episodioDos: Episode!
    
    var seasonOne: Season!
    var season1: Season!
    var seasonTwo: Season!

    override func setUp() {
       
        
        // Formato para las fechas
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
       
        
       
        
        //Episodios
        episodioUno = Episode(title: "Winter is comming", date: formatter.date(from: "2011/04/17")!, season: seasonOne)
        episodio1 = Episode(title: "Winter is comming", date: formatter.date(from: "2011/04/17")!, season: seasonOne)

        episodioDos = Episode(title: "The Kingsroad", date: formatter.date(from: "2011/04/24")!, season: seasonOne)
        
       
        //Primera temporada
        
        seasonOne = Season(name: "Cancion de hielo y fuego", releaseDate: formatter.date(from: "2011/04/17")!)
        season1 = Season(name: "Cancion de hielo y fuego", releaseDate: formatter.date(from: "2011/04/17")!)
        
        
        seasonTwo = Season(name: "Choque de reyes", releaseDate: formatter.date(from: "2012/04/01")!)
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEpisodeExist() {
        XCTAssertNotNil(episodioUno)
    }
    
    func testSeasonExist() {
        XCTAssertNotNil(seasonOne)
    }
    
    func testSeasonAddEpisode() {
        XCTAssertEqual(seasonOne.count, 0)
        
        seasonOne._episodes.insert(episodioUno)
      //  seasonOne.add(episode: episodioUno)
        
        XCTAssertEqual(seasonOne.count, 1)
        
        seasonOne._episodes.insert(episodioDos)
        //seasonOne.add(episode: episodioDos)
        XCTAssertEqual(seasonOne.count, 2)
        
    }
    
    func testEpisodeHashable() {
        
        XCTAssertNotNil(episodioUno.hashValue)
    }
    
    func testSeasonHashable() {
        
        XCTAssertNotNil(seasonOne.hashValue)
    }
    
    func testEpisodeEquality() {
        
        // Identidad
        
        XCTAssertEqual(episodioUno, episodioUno)
        
        // Igualdad
        
        
        XCTAssertEqual(episodio1, episodioUno)
        
        // Desiagualdad
        
        
        XCTAssertNotEqual(episodio1, episodioDos)
        
        
    }
    
    func testSeasonEquality() {
        
        // Identidad
        
        XCTAssertEqual(seasonOne, seasonOne)
        
        // Igualdad
        
        
        XCTAssertEqual(season1, seasonOne)
        
        // Desiagualdad
        
        
        XCTAssertNotEqual(seasonOne, seasonTwo)
        
        
    }
    
    
    func testEpisodeComparison() {
        XCTAssertLessThan(episodioUno,episodioDos)
    }
    
    func testSeasonComparison() {
        
        XCTAssertLessThan(seasonOne, seasonTwo)
    }
    
    
    
    
    func testHouse_SortedEpisodes_ReturnsAnArrayOfSortedEpisodes() {
        // [1 , 5 , 4] -> .sorted() -> [1, 4, 5]
        // [1 , 2, 3 , 4] -> .sorted() -> [1, 2, 3, 4]
        XCTAssertEqual(season1.sortedEpisodes, season1.sortedEpisodes.sorted())
    }
    
    
 

}
