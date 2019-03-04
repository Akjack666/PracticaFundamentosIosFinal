//
//  Repository.swift
//  Westeros
//
//  Created by Alexandre Freire on 06/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    typealias HouseFilter = (House) -> Bool
    var houses: [House] { get } // sólo get porque será de sólo lectura
    func house(named: String) -> House?
    func houses(filteredBy filter: HouseFilter) -> [House]
}


protocol SeasonsFactory {
    typealias SeasonFilter = (Season) -> Bool
    var seasons: [Season] { get } // sólo get porque será de sólo lectura
    func season(named: String) -> Season?
    func seasons(filteredBy filter: SeasonFilter) -> [Season]
}




final class LocalFactory: HouseFactory, SeasonsFactory {
    
    
    var seasons: [Season] {
        
        
        // Formato para las fechas
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        
        // Temporadas
        let seasonOne = Season(name: "Season 1", releaseDate: formatter.date(from: "2011/04/17")!)
        let seasonTwo = Season(name: "Season 2", releaseDate: formatter.date(from: "2012/04/01")!)
        let seasonThree = Season(name: "Season 3", releaseDate: formatter.date(from: "2013/03/31")!)
        let seasonFour = Season(name: "Season 4", releaseDate: formatter.date(from: "2014/04/06")!)
        let seasonFive = Season(name: "Season 5", releaseDate: formatter.date(from: "2015/04/12")!)
        let seasonSix = Season(name: "Season 6", releaseDate: formatter.date(from: "2016/04/24")!)
        let seasonSeven = Season(name: "Season 7", releaseDate: formatter.date(from: "2017/06/16")!)
        
        
        // Episodios
       
        let episode1_1 = Episode(title: "Winter is comming", date: formatter.date(from: "2011/04/17")!, season: seasonOne)
        let episode1_2 = Episode(title: "The Kingsroad", date: formatter.date(from: "2011/04/24")!, season: seasonOne)
        
        let episode2_1 = Episode(title: "The Notrh Remembers", date: formatter.date(from: "2012/04/01")!, season: seasonTwo)
        let episode2_2 = Episode(title: "The Nigth Lands", date: formatter.date(from: "2012/04/08")!, season: seasonTwo)
        
        let episode3_1 = Episode(title: "Valar Dohaeris", date: formatter.date(from: "2013/03/31")!, season: seasonThree)
        let episode3_2 = Episode(title: "Dark wings, dark words", date: formatter.date(from: "2013/04/6")!, season: seasonThree)
        
        let episode4_1 = Episode(title: "Two swords", date: formatter.date(from: "2014/04/06")!, season: seasonFour)
        let episode4_2 = Episode(title: "The Lion and the rose", date: formatter.date(from: "2014/04/13")!, season: seasonFour)
        
        let episode5_1 = Episode(title: "The wars to come", date: formatter.date(from: "2015/04/12")!, season: seasonFive)
        let episode5_2 = Episode(title: "The house of black and white", date: formatter.date(from: "2015/04/19")!, season: seasonFive)
        
        let episode6_1 = Episode(title: "The red woman", date: formatter.date(from: "2016/04/24")!, season: seasonSix)
        let episode6_2 = Episode(title: "Home", date: formatter.date(from: "2016/05/01")!, season: seasonSix)
        
        let episode7_1 = Episode(title: "Dragon Stone", date: formatter.date(from: "2017/06/16")!, season: seasonSeven)
        let episode7_2 = Episode(title: "Stormborn", date: formatter.date(from: "2017/06/23")!, season: seasonSeven)
        
        
        seasonOne.add(episodes: episode1_1, episode1_2)
        seasonTwo.add(episodes: episode2_1, episode2_2)
        seasonThree.add(episodes: episode3_1, episode3_2)
        seasonFour.add(episodes: episode4_1, episode4_2)
        seasonFive.add(episodes: episode5_1, episode5_2)
        seasonSix.add(episodes: episode6_1, episode6_2)
        seasonSeven.add(episodes: episode7_1, episode7_2)
        
        
        return [seasonOne, seasonTwo, seasonThree, seasonFour, seasonFive, seasonSix, seasonSeven].sorted()
        
    }
    
    
    var episodes: [Episode] {
        // Formato para las fechas
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        
        let seasonOne = Season(name: "Season 1", releaseDate: formatter.date(from: "2011/04/17")!)

        
        
        let episode1_1 = Episode(title: "Winter is comming", date: formatter.date(from: "2011/04/17")!, season: seasonOne)
        let episode1_2 = Episode(title: "The Kingsroad", date: formatter.date(from: "2011/04/24")!, season: seasonOne)
        
        return [episode1_1, episode1_2]
    }
    
    
    
    func season(named name: String) -> Season? {
        let season = seasons.first{ $0.name.uppercased() == name.uppercased() } // Con uppercased() "normalizamos los valores"
        return season
    }
    
    func seasons(filteredBy theFilter: (Season) -> Bool) -> [Season] {
        return seasons.filter(theFilter)
    }
    
    
    
  
    

    var houses: [House] {
        // Creación de casas
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "León Rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall")!, description: "Dragón tricéfalo")
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wikiURL: starkURL)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", wikiURL: lannisterURL)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", wikiURL: targaryenURL)
        
        // Añadir algunos personajes
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        starkHouse.add(persons: robb, arya)
        lannisterHouse.add(persons: tyrion, cersei, jaime)
        targaryenHouse.add(person: dani)
        
        return [targaryenHouse, starkHouse, lannisterHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        //let house = houses.filter{ $0.name == name }.first
        let house = houses.first{ $0.name.uppercased() == name.uppercased() } // Con uppercased() "normalizamos los valores"
        return house
    }
    
    func houses(filteredBy theFilter: (House) -> Bool) -> [House] {
        return houses.filter(theFilter)
    }
}








