//
//  Category.swift
//  coder-swag
//
//  Created by Igor Chernyshov on 08.09.17.
//  Copyright © 2017 Frostfell. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String       //public variables can be modified from anywhere in a program
    private(set) public var imageName: String   //private(set) public means that variable can be set from here but used by other VC's and objects
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
