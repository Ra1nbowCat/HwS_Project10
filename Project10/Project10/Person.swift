//
//  Person.swift
//  Project10
//
//  Created by Илья Лехов on 17.06.2022.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name:String, image: String) {
        self.image = image
        self.name = name 
    }
}
