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
    var title: String
    var date: Date
    
    
    /*
    // propiedades computada
    var season: Season {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        

        return _season ?? Season(episodios: [], nombre: "No pertenece a una temporada", fecha_lanzamiento: formatter.date(from: "2011/04/17")!)
    }
   */
    
    // Inicializacion
    
    init(title: String, date: Date, season: Season? = nil) {
        self.title = title
        self.date = date
        _season = season
    }
    
}


// Proxys de igualdad y comparacion
extension Episode {
    var proxyForEquality: String {
        return "\(title) \(date)"
    }
    
    
    var proxyForComparison: Date {
        return date
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
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// extension para devolver una descripcion

extension Episode: CustomStringConvertible {
    var description: String {
        return "El episodio \(title) se lanzo en \(date) y pertenece a la temporada \(String(describing: _season?.name))"
    }
}



