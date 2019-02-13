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
    var seasonOne: Season!

    override func setUp() {
       
        
        // Formato para las fechas
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
       
        
       
        
        //Primer episodio
        episodioUno = Episode(titulo: "Winter is comming", fecha: formatter.date(from: "2011/04/17")!, season: seasonOne)
        
       
        //Primera temporada
        
        seasonOne = Season(nombre: "Cancion de hielo y fuego", fecha_lanzamiento: formatter.date(from: "2011/04/17")!)
        
        
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
    
    

}
