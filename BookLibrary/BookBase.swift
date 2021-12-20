//
//  BookBase.swift
//  BookLibrary
//
//  Created by Pavel Isakov on 18.12.2021.
//

import Foundation

class BookBaseClass {
    
    let defaults = UserDefaults.standard
    
    static let shared = BookBaseClass()
    
    struct BookBaseStruct:Codable {
        var bookName: String
        var bookDate: String
        var name: String{
            return "'\(bookName)'         \(bookDate)"
        }
    }
    
    
    //массив книг
    var booksArray: [BookBaseStruct]{
        
        //получение книги
        get{
            if let data = defaults.value(forKey: "booksArray") as? Data{
                return try! PropertyListDecoder().decode([BookBaseStruct].self, from: data)
            }else{
                return [BookBaseStruct]()
            }
        }
        //сохранение книги
        set{
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "booksArray")
            }
        }
        
    }
    
    //метод сохраниея книги
    func saveBook(bookName: String, bookData: String){
        
        let book = BookBaseStruct(bookName: bookName, bookDate: bookData)
        booksArray.insert(book, at: 0)
        
    }
   
}
