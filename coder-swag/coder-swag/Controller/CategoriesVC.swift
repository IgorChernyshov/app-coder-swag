//
//  ViewController.swift
//  coder-swag
//
//  Created by Igor Chernyshov on 08.09.17.
//  Copyright © 2017 Frostfell. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell .updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row] //Run getCategories() function at array index "row" and put the value into "category" variable
        performSegue(withIdentifier: "ProductsVC", sender: category) //Pass variable "category" to ProductsVC and perform segue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()      //This will be displayed on a VC that we will be segued to
            barBtn.title = ""                   //Title of this UIBarButtonItem object = ""
            navigationItem.backBarButtonItem = barBtn   //Now they both are of the same type and we can put our item there
            assert(sender as? Category != nil)  //is sender a non-empty variable of type "Category"? if not - crash the app
            productsVC.initProducts(category: sender as! Category)  //run function initProducts with argument "category" that equals sender of type "Category"
        }
    }
}
