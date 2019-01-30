//: [Previous](@previous)

import UIKit

// Programa para representar Libros

// Primera sorpresa: No hereda de NSObject
class AnonymousBook {
    let title: String
    
    // En las clases, si no le das un valor por defecto a las propiedades (o son opcionales), tienes que darle un valor a través de un init
    // Por el miedo a nil
    init(title: String) {
        self.title = title
    }

}

// Herencia: En Swift, una clase puede tener 0 ó 1 super clase
// Puede heredar de una clase

final class Book: AnonymousBook {
    let authors: [String]
    let genre: Genre
    
    // Designado: el que hace el trabajo sucio
    init(title: String, authors: [String], genre: Genre) {
        // Lo primero que hay que hacer en una subclase, es incializar (darle valor) a tus propias propiedades
        self.authors = authors
        self.genre = genre
        // Luego, una vez has limpiado tu propio desorden, llamas a super.init
        super.init(title: title)
    }
}

// Inits de conveniencia
extension Book {
    convenience init(title: String, author: String, genre: Genre) {
        // Los inits de conveniencia SIEMPRE llaman a self.init
        self.init(title: title, authors: [author], genre: genre)
    }
}

// Personajes de libro
// Cuando especificamos una clase como final, significa que ninguna clase podrá heredar de ella
// Es mejor declarar una clase SIEMPRE como final. En caso de que necesites heredar de ella, simplemente borras "final"
final class BookCharacter {
    var name: String
    let book: Book
    
    init(name: String, book: Book) {
        (self.name, self.book) = (name, book)
    }
}

// Las clases también implementan/conforman protocolos
extension BookCharacter: CustomStringConvertible {
    var description: String {
        return "<\(type(of: self))>: \(name) appears in \(book.title)"
    }
}

let book = Book(title: "GoT", author: "GRRM", genre: .sciFi)
let character = BookCharacter(name: "Jon Snow", book: book)

print(character)

// Sobreescritura de métodos: una subclase puede tener su propia implementación de un método que hereda de la superclase

final class MyView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Aquí haría mis cosas .......
    }
}

// Las clases son tipos por referencia
// Que las instancias se comparten

var character2 = character

character2.name = "Arya Stark"

character.name
character2.name


// Enunms: se utilizan para modelar conjuntos finitos
// Por ejemplo, los posibles géneros literarios
enum Genre: String {
    case thriller // "thriller"
    case sciFi = "Ciencia ficción"
    
    //...
}

print("El género del libro \(book) es \(book.genre.rawValue)")

// Un enum NO TIENE que ser de algún tipo primitivo, como ocurre en otros lenguajes


let array: [Genre] = [.sciFi, .thriller]

let genre = Genre.sciFi

let genre2: Genre = .thriller

// OPTIONALS
// Una variable de tipo opcional puede contener una instancia del tipo, o nil
// nil = NULL = null = None

var got: Book?

got = nil
got = book
got = nil










//: [Next](@next)
