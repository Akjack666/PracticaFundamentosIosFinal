import UIKit

/*:
 # FUNCIONES COMO VALORES
 
 En Swfit, las funciones son "ciudadanos de primera clase".
 Son como cualquier otro valor más: Int, String, House, Sigil....
 
 Podremos meter funciones dentro de arrays, guardarlas en variables, pasarlo como un parámetro de una función,
 devolver una función, ...
 
 */

typealias IntToInt = (Int) -> Int

// Funciones como valores de retorno de otra función
func adder(n: Int) -> IntToInt {
    
    // Las funciones son clousures
    // Y capturan el entorno léxico
    func f(x: Int) -> Int {
        return x + n
    }
    
    return f
}

let add42 = adder(n: 42)
let add10 = adder(n: 10)
add42(1)
add10(1)



// Funciones como parámetros de entrada:
func apply(function: IntToInt, number: Int) -> Int {
    return function(number)
}

apply(function: add42, number: 8)
apply(function: add10, number: 8)


// Toda función de Swift es un clousure y puede acceder a todo lo que se haya definido previamente (capturan el entorno léxico)

func f(_ n: Int) -> Int {
    return n + 1
}

// Esto es equivalente a hacer esto otro (lo que hace el compilador por debajo)

let f1 = { (n: Int) -> Int in // in es para indicar a partir de dónde empieza el cuerpo de "la función"
    return n + 1
}

f(8)
f1(8)

func z(n: String) -> Int {
    return 0
}
// Las funciones, al ser tipos como cualquier otro, se pueden meter en colecciones
let functions = [f, f1, add10, add42]

for fn in functions {
    print(fn(42))
}


// La sintaxis abreviada de clousures
let clousures: [IntToInt] = [
    f,
    { (n: Int) -> Int in return n+1 }, // 100 % explícita
    { (n: Int) in return n+1 }, // No hace falta especificar el tipo de retorno
    { n in return n+1 }, // Tampoco hace falta especificar el tipo de entrada. Lo infiere de la primera f
    { n in n+1 }, // Tampoco hace falta poner el "return" cuando el cuerpo sólo tieme una linea
    { $0 + 1 } // No hace falta nombrar el parámetro
]

// TRAILING CLOSURES
// La clausura de cuelga, clausura de finalizacón, bloque de finalización, completionHandler, etc...
// Curiosidad: la sintaxis ultra-minimalista ($$$) se usa MUCHO en Swift sobre todo ellos trailing closures.

let evens = [6, 12, 2, 8, 10, 4]

var result = evens.sorted(by: { (a: Int, b: Int) in
    return a > b
})

result = evens.sorted { (a: Int, b: Int) in
    return a < b
}

result = evens.sorted { a, b in
    a < b
}

result = evens.sorted{ $0 < $1 }
result


// PROGRAMACIÓN FUNCIONAL
// Clásicos de la FP: map, flatMap, compactMap, filter, reduce
// Son funciones que se aplican sobre colecciones

// MAP
// Recibe una colección y una función (closure) que se aplica a cada elemento

// La manera tradicional
var result2: [Int] = []
for element in evens {
    result2.append(element * 2)
}
result2

// Map aplica una transformación a cada elemento
result2 = evens.map{ $0 * 2 }

let strArray = evens.map {
    return String($0)
}
strArray

// FILTER: Recibe un filtro y devuelve un bool
result2 = []
for element in evens {
    if element > 6 {
        result2.append(element)
    }
}
result2

// Esto se hace más guay con filter
result2 = evens.filter { $0 > 6 }
result2

// flatMap, que ahora se llama compactMap
let intsOrNil: [String?] = ["1", "2", nil, "hola", nil, "7", nil]
let limpioDeNiles = intsOrNil.compactMap{ $0 }
limpioDeNiles


let str: [String] = ["1", "2", "Paco", "Luis", "3", "8"]

let resultttt = str.compactMap {
    return Int($0)
}

resultttt


let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// La salida tiene que ser del tipo "El número es X" sólo en aquellos casos en los que el número sea par

let resultado =
    numeros
        .filter { $0 % 2 == 0 } // [2, 4, 6, 8, 10]
        .map { String($0) } // ["2", "4", "6", "8", "10"]
        .map { "El número es \($0)" }

resultado



