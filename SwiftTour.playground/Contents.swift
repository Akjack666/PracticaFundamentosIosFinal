import UIKit

// Valores, Bindings, REPL (Read-Eval-Print-Loop)

// let crea una constante (inmutable) mientras que var crea variables (pueden modificarse)
let answer = 40 + 2

var myVariable = "Soy una variable y puedo cambiar"
myVariable = "Cambié"

// myVariable = 8 ERROR! Swift es un lenguaje de tipado fuerte y estático

// Podemos definir de forma EXPLÍCITA el tipo de una variable
let name: String = "Jon Snow"
let name2 = "Tyrion"
// Swift tiene inferencia de tipos: Swift es capaz de descubrir por el solo, el tipo de una variable

// Un alias para un tipo
// typealias NOMBRE_NUEVO = NOMBRE_VIEJO

typealias Integer = Int

let number: Integer = 8

type(of: number)

typealias Author = String

let author: Author = "George R. R. Martin"
let grr: String = "George R. R. Martin"


// El símbolo anónimo
// Cualquier cosa que asignes a ese símbolo, se va al garete
let _ = "Robb Stark"
let _ = "Stannis"

// Tanto Stannis como Robb se han muerto

// Intro a funciones
func add(x: Int, y: Int) -> Int {
    return x + y
}

add(x: 8, y: 42)

// Parámetros con nombres internos y externos
func fractionOf(numerator n: Double, denominator d: Double) -> Double {
    return n / d
}

fractionOf(numerator: 40, denominator: 20)

func add42(_ a: Int) -> Int {
    return 42 + a
}

add42(8)
// fractionOf(numerator: 7, denominator: 0)

