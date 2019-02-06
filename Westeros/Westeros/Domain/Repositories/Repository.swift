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
    var houses: [House] { get } // sólo get porque será de sólo lectura
}

final class LocalFactory: HouseFactory {
    var houses: [House] {
        // Creación de casas
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "León Rampante")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        // Añadir algunos personajes
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        
        starkHouse.add(person: robb)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        
        return [lannisterHouse, starkHouse]
    }
}
