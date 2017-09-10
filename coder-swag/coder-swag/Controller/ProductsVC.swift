//
//  ProductsVC.swift
//  coder-swag
//
//  Created by Igor Chernyshov on 10.09.17.
//  Copyright © 2017 Frostfell. All rights reserved.
//

import UIKit        //Add class and identifier of view controller (in this case class of VC is ProductsVC)

class ProductsVC: UIViewController, UICollectionViewDelegate,  UICollectionViewDataSource {

    @IBOutlet weak var productsCollection: UICollectionView!
    
    private(set) public var products = [Product]()  //Create an empty array so the app won't crash in case of missing data (ex. from the Internet)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsCollection.dataSource = self
        productsCollection.delegate = self
    }

    func initProducts(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {   //reuse identifier is set for the cell in storyboard editor
            let product = products[indexPath.row]   //get an appropriate cell from "products" array and put it into "product" constant
            cell.updateViews(product: product)      //run updateViews function to put the data from "products" constant into new cell
            return cell     //return the complete cell to collectionView
        }
        
        return ProductCell()
    }
    
}
