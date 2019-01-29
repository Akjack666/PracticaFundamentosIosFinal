//: [Previous](@previous)

import Foundation

/*:
 # NUEVOS TIPOS
 
 - Tuplas
 - Struct
 - Class
 - Enum
 
 */

// TUPLAS
// Son listas de distintos tipos, pegados uno detrás del otro
var httpResponse = ("OK", 200)
// Las tuplas tienen tipo. En este caso es de tipo (String, Int)

httpResponse = ("Internal server error", 500)

// Acceso a los valores de la tupla
// Se accede por posición
httpResponse.0
httpResponse.1
// httpResponse.2 ERROR!!

// Devolver más de un valor con tuplas
func intDiv(_ a: Int, _ b: Int) -> (Int, Int) {
    return ( a/b, a%b )
}

intDiv(3, 2)

typealias HTTPStatus = (code: Int, text: String)
// Los elementos de una tupla pueden tener nombre

typealias HTTPRequest = String

typealias HTTPResponse = (body: String, status: HTTPStatus)

func httpServer(request: HTTPRequest) -> HTTPResponse {
    // Habría que poner lo de verdad
    return ("It worked", (200, "OK"))
}

let response = httpServer(request: "index.html")

dump(response)

response.body
response.status

// Pattern Matching: lo usamos para "desensamblar" la tupla en varias variables

let (cociente, resto) = intDiv(5, 2)

// Y si s
print(cociente)
print(resto)

let (_, status) = httpServer(request: "index.html")

let (code, _) = status

code

// TUPLAS DE N ELEMENTOS
// A la tupla de n elementos se le llama n-tupla
(3, 4, "aaa") // 3-tupla
(3, 4) // 2-tupla
(1) // 1-tupla? No. Es el propio elemento
() // 0-tupla? Sí. Significa la nada. Como Void en otros lenguajes

func f(a: Int) {
    print(a)
}

func h(a: Int) -> () {
    print(a)
}






//: [Next](@next)
