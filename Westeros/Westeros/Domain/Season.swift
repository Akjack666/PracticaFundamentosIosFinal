//
//  Season.swift
//  Westeros
//
//  Created by g5 on 13/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation


typealias Episodes = Set<Episode>

final class Season {
    
    
    // Propiedades
    
     // no puede estar vacio, una temporada tiene que tener minimo un episodio
    var nombre: String
    var fecha_lanzamiento: Date
    public var _episodes: Episodes
    
    
    
    //Inicializacion
    
    init(nombre: String, fecha_lanzamiento: Date) {
        self.nombre = nombre
        self.fecha_lanzamiento = fecha_lanzamiento
        _episodes = Episodes()
    }
    
    
}

// Proxys de igualdad y comparacion
extension Season {
    var proxyForEquality: String {
        return "\(nombre) \(fecha_lanzamiento)"
    }
    
    
    var proxyForComparison: String {
        return nombre
    }
 
}


// Extension Hashable
extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
        }
    }


// Extension de igualdad

extension Season: Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}


// Extension de comparación

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
        return lhs.nombre < rhs.proxyForComparison
    }
}

// extension para devolver una descripcion

extension Season: CustomStringConvertible {
    var description: String {
        return "La temporada \(nombre) se lanzo en \(fecha_lanzamiento) con \(_episodes.count) episodios"
    }
}


// Extension para saber el numero de episodios en una temporada


extension Season {
    var count: Int {
        return _episodes.count
    }
    
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }
    
    func add(episode: Episode) {
        guard episode._season?.nombre == nombre else { return }
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach { add(episode: $0) }
    }
 
}


    
    

