//
//  CategoryCell.swift
//  coder-swag
//
//  Created by Igor Chernyshov on 08.09.17.
//  Copyright © 2017 Frostfell. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews(category: Category) {      //Grab data that we've set in Model
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
