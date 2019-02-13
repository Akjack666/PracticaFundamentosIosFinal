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
    
    weak var _season: Season? // Asumimos que puede haber episodios que no pertenezcan a una temporada
    var titulo: String
    var fecha: Date
    
    
    /*
    // propiedades computada
    var season: Season {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        

        return _season ?? Season(episodios: [], nombre: "No pertenece a una temporada", fecha_lanzamiento: formatter.date(from: "2011/04/17")!)
    }
   */
    
    // Inicializacion
    
    init(titulo: String, fecha: Date, season: Season? = nil) {
        self.titulo = titulo
        self.fecha = fecha
        _season = season
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
        return "El episodio \(titulo) se lanzo en \(fecha) y pertenece a la temporada \(String(describing: _season?.nombre))"
    }
}



