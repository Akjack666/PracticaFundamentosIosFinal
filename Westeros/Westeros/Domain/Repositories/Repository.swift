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
       let seasonOne = Season(nombre: "Season 1", fecha_lanzamiento: formatter.date(from: "2011/04/17")!)
       let seasonTwo = Season(nombre: "Season 2", fecha_lanzamiento: formatter.date(from: "2012/04/01")!)
       let seasonThree = Season(nombre: "Season 3", fecha_lanzamiento: formatter.date(from: "2013/03/31")!)
       let seasonFour = Season(nombre: "Season 4", fecha_lanzamiento: formatter.date(from: "2014/04/06")!)
       let seasonFive = Season(nombre: "Season 5", fecha_lanzamiento: formatter.date(from: "2015/04/12")!)
       let seasonSix = Season(nombre: "Season 6", fecha_lanzamiento: formatter.date(from: "2016/04/24")!)
       let seasonSeven = Season(nombre: "Season 7", fecha_lanzamiento: formatter.date(from: "2017/06/16")!)
        
        
        // Episodios
       
      let episode1_1 = Episode(titulo: "Winter is comming", fecha: formatter.date(from: "2011/04/17")!, season: seasonOne)
      let episode1_2 = Episode(titulo: "The Kingsroad", fecha: formatter.date(from: "2011/04/24")!, season: seasonOne)
        
      let episode2_1 = Episode(titulo: "The Notrh Remembers", fecha: formatter.date(from: "2012/04/01")!, season: seasonTwo)
      let episode2_2 = Episode(titulo: "The Nigth Lands", fecha: formatter.date(from: "2012/04/08")!, season: seasonTwo)
        
      let episode3_1 = Episode(titulo: "Valar Dohaeris", fecha: formatter.date(from: "2013/03/31")!, season: seasonThree)
      let episode3_2 = Episode(titulo: "Dark wings, dark words", fecha: formatter.date(from: "2013/04/6")!, season: seasonThree)
        
      let episode4_1 = Episode(titulo: "Two swords", fecha: formatter.date(from: "2014/04/06")!, season: seasonFour)
      let episode4_2 = Episode(titulo: "The Lion and the rose", fecha: formatter.date(from: "2014/04/13")!, season: seasonFour)
        
      let episode5_1 = Episode(titulo: "The wars to come", fecha: formatter.date(from: "2015/04/12")!, season: seasonFive)
      let episode5_2 = Episode(titulo: "The house of black and white", fecha: formatter.date(from: "2015/04/19")!, season: seasonFive)
        
      let episode6_1 = Episode(titulo: "The red woman", fecha: formatter.date(from: "2016/04/24")!, season: seasonSix)
      let episode6_2 = Episode(titulo: "Home", fecha: formatter.date(from: "2016/05/01")!, season: seasonSix)
        
      let episode7_1 = Episode(titulo: "Dragon Stone", fecha: formatter.date(from: "2017/06/16")!, season: seasonSeven)
      let episode7_2 = Episode(titulo: "Stormborn", fecha: formatter.date(from: "2017/06/23")!, season: seasonSeven)
        
        
        seasonOne.add(episodes: episode1_1, episode1_2)
        seasonTwo.add(episodes: episode2_1, episode2_2)
        seasonThree.add(episodes: episode3_1, episode3_2)
        seasonFour.add(episodes: episode4_1, episode4_2)
        seasonFive.add(episodes: episode5_1, episode5_2)
        seasonSix.add(episodes: episode6_1, episode6_2)
        seasonSeven.add(episodes: episode7_1, episode7_2)
        
        
        return [seasonOne, seasonTwo, seasonThree, seasonFour, seasonFive, seasonSix, seasonSeven].sorted()
        
    }
    
    func season(named name: String) -> Season? {
        let season = seasons.first{ $0.nombre.uppercased() == name.uppercased() } // Con uppercased() "normalizamos los valores"
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








