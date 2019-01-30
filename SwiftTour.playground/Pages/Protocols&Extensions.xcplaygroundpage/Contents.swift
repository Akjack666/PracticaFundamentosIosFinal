//: [Previous](@previous)

import Foundation

/*
 
 Extension: es como una category en Objective-C
 
 Sirven para:
 
 1. Añadir funcionalidad a una clase / struct pre-existente
 2. Modularizar clases / structs
 
 */

extension Int {
    
    func invert() -> Int {
        return -self
    }
}

8
8.invert()
-8.invert()

/*
 ¿Qué cosas no se pueden añadir a una extensión?
 
 - Nada que pueda modificar el layout de memoria del objecto(añadir propiedades ALMACENADAS).
 - Ciertos tipos de inits (tiene que ver con el pánico que Swift le tiene a nil)
 */

// Esto no se puede hacer
//extension Int { // Si Int ocupa N bytes
//    var a: Double = 0 // Ocuparía Int + Double
//}


// La definición de las structs, lo más sencillo posible
struct Complex {
    
    // Las propiedades almacenadas
    let x: Double
    let y: Double
}

extension Complex {
    // Propiedades computadas, se evalúan sobre la marcha urilizando las propiedades almacenadas
    // Tienen getter, y setter
    var magnitude: Double {
        get {
            return ((x*x) + (y*y)).squareRoot()
        }
        
//        set {
//            x = newValue / y
//        }
    }
}


/*
 
 PROTOCOLS: Muy similiar a los interfaces de Java o los protocols de Objective-C
 
 Swift hay un porrón de protocolos
 
 Obligatorio conocer los siguientes:
 - CustomStringConvertible: description (ObjeC) o toString (Java)
 - Equatable: dos instancias del mismo tipo son iguales o equivalentes
 - Hashable: tiene un valor de hash (podríamos meterlo como key de un diccionario)
 - Comparable: permite determinar si un objeto es mayor o menor que otro del mismo tipo.
 */


// Cuando un tipo "implementa" un protocolo, lo que se suele decir es que
// ese tipo se "conforma" a ese protocolo.

extension Complex: CustomStringConvertible {
    var description: String {
        // Interpolación de cadenas
        
        return "\(x) + \(y)i" // real + imaginaryi
    }
}

let c = Complex(x: 23, y: -8)

c.magnitude

extension Complex: Equatable {
    static func == (lhs: Complex, rhs: Complex) -> Bool {
        //return lhs.x == rhs.x && lhs.y == rhs.y
        return (lhs.x, lhs.y) == (rhs.x, rhs.y) // tuplas y pattern matching
    }
}

let d = Complex(x: 9, y: 2)

d == d
d != c

// Nosotros también podemos crear nuestros propios protocolos
protocol Answerable {
    // propiedades y/o métodos que, obligatoriamente, tendrán que implementas
    // los tipos que se conformen (implementen) este protocolo
    var answer: Int { get }
}

extension Answerable {
    var answer: Int {
        return 8
    }
}

extension Int: Answerable {}

extension String: Answerable {
    var answer: Int {
        return 42
    }
}

"What is the meaning of Life, the Universe, and everything?".answer

1234651827.answer
// Implementación por defecto de Protocols






//: [Next](@next)
