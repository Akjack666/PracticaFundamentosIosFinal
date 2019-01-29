//: [Previous](@previous)

import Foundation

/*:
 Las structs tienen dos ventajas sobre las tuplas:
 
 - Los componentes SIEMPRE tienen nombre
 - Pueden tener métodos
 */

// Los nombres de los tipos SIEMPRE SIEMPRE SIEMPRE empiezan por mayúsculas
// Los nombres de las propiedades, constantes, variables, empiezan por minúsculas

struct Complex {
    let x: Double
    let y: Double
    
    // Las structs crean un init por defecto con tantos parámetros como
    // propiedades tenga, salvo que nos creemos nuestro propio init.
    
    // Desde ese momento, el init por defecto desaparece, y si lo quieres
    // tienes que crearlo tú mismo.
    init(real: Double, imaginary: Double) {
        x = real
        y = imaginary
    }
    
    init(real: Double) {
        x = real
        y = 0
    }

    init(imaginary: Double) {
        x = 0
        y = imaginary
    }
    
    func magnitude() -> Double {
        return ((x*x) + (y*y)).squareRoot()
    }
}

let complex1 = Complex(real: 3, imaginary: -4)

complex1.x // real
complex1.y // imaginaria

let complex2 = Complex(real: 3, imaginary: -4)

// No todos Los números complejos tiene parte real y parte imaginaria
let complex3 = Complex(real: 4)

let complex4 = Complex(imaginary: -9)



// Structs & INMUTABILIDAD
// Por defecto, todo en una esctructura es inmutable

struct Point {
    
    var x: Double
    var y: Double
    
    mutating func moveTo(x: Double, y: Double) {
        self.x = x
        self.y = y
        // Como se llaman igual (el parámetro y la propiedad), el que
        // manda dentro del cuerpo de la función es el parámetro. Le hace sombra.
        // Para acceder a las propiedades, utilizamos self.
        
        // Nos obliga a poner delante la palabra mutating porque modificamos los valores de
        // las propiedades.
    }
}

var myPoint = Point(x: 10, y: 20)
myPoint.moveTo(x: 40, y: 23)


// Las structs nunca se comparten (entre dos variables). Esto es la principal diferencia que
// tiene con las clases.

var p1: Point = Point(x: 1, y: 1) // (1, 1)

var p2 = p1 // (1, 1)

p2.moveTo(x: 30, y: 40) // (30, 40)

print(p1.x)
print(p2.x)


// las instancias en las clases SE COMPARTEN

// Las structs son Value-Types (tipos por valor), se copian.

// Las clases, son Reference-Types, se comparten

// Las structs NO tienen herencia. ¿Cómo se le añaden entonces super poderes a las structs?
// Mediante protocolos





//: [Next](@next)
