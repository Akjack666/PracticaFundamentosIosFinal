//
//  Episode.swift
//  Westeros
//
//  Created by g5 on 13/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation


final class Episode {
    
    
    // Propiedades
    
    weak var season: Season? // Asumimos que puede haber episodios que no pertenezcan a una temporada
    var titulo: String
    var fecha: Date
    
    // Inicializacion
    
    init(titulo: String, fecha: Date) {
        self.titulo = titulo
        self.fecha = fecha
    }
    
}


// Proxys de igualdad y comparacion
extension Episode {
    var proxyForEquality: String {
        return "\(titulo) \(fecha)"
    }
    
    
    var proxyForComparison: String {
        return titulo
    }
    
}


// Extension Hashable
extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}


// Extension de igualdad

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}


// Extension de comparación

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.titulo < rhs.proxyForComparison
    }
}

// extension para devolver una descripcion

extension Episode: CustomStringConvertible {
    var description: String {
        return "El episodio \(titulo) se lanzo en \(fecha) y pertenece a la temporada \(season!.nombre)"
    }
}



