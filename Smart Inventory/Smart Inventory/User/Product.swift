//
//  Product.swift
//  Smart Inventory
//
//  Created by Bharadwaj Dasari on 11/18/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import Foundation
import UIKit

@objcMembers
class Product: NSObject, Decodable {
    
    static var product:Product = Product()

    var name:String
    var productDescription:String
    var quantity:Int
    var price:Double
    
    override var  description:  String  {
        //  NSObject  adheres  to  CustomStringConvertible
        return "Name:  \(name  ??  ""),  Description:  \(productDescription)"
        
    }
    
    init(name:String, productDescription:String, quantity:Int, price:Double){
        self.name  =  name
        self.productDescription = productDescription
        self.quantity = quantity
        self.price = price
    }
    
    convenience override init(){
        self.init(name:"", productDescription:"", quantity:0, price:0.0)
        
    }
}

@objcMembers
class AllProducts {
     static var allProducts:AllProducts = AllProducts()
//    // represents the product functions
//    static var allProducts:AllProducts = AllProducts()
//    var productsList:[Product] = []
//
//    //sets the product list
//    func setProductsList(productsList:[Product]) {
//        self.productsList = productsList
//    }
//    //gets all the product list
//    func getAllProductsList() -> [Product] {
//        return productsList
//    }
//
//    subscript(index:Int) -> Product{
//        return productsList[index]
//    }
    
    let backendless = Backendless.sharedInstance()
    var productDataStore:IDataStore!
    
    static var product:Product = Product()
    
    var products:[Product] = []
    init() {
        productDataStore = backendless?.data.of(Product.self)
    }
    
    func saveAnouncements(product:Product)
    {
        var itemToSave = product
        
        productDataStore.save(itemToSave,response:{(result) -> Void in
            itemToSave = result as! Product
            self.products.append(itemToSave)
            self.retrieveAllProducts()},
                                   
                                   error:{(exception) -> Void in
                                    print(exception.debugDescription)
                                    
        })
    }
    
    func retrieveAllProducts()
    {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setPageSize(100)
        
        productDataStore.find(queryBuilder, response: {(results) -> Void in
            self.products = results as! [Product]
            print(self.products.count)
        },
                                   error:{(exception) -> Void in
                                    print(exception.debugDescription)
        })
    }
    
}
