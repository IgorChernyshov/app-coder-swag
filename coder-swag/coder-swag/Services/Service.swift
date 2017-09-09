//
//  Service.swift
//  coder-swag
//
//  Created by Igor Chernyshov on 08.09.17.
//  Copyright © 2017 Frostfell. All rights reserved.
//

import Foundation

class DataService {                         //here we create a "singleton"
    static let instance = DataService()     //static means you can only have one copy of DataService() in RAM at one time
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    func getCategories() -> [Category] {      //go to "server" and get data from there
        return categories
    }
}
