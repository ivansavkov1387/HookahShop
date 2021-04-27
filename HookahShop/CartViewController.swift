//
//  CartViewController.swift
//  HookahShop
//
//  Created by Иван on 4/27/21.
//

import UIKit

class CartViewController: UIViewController {
    var itemLabel = UILabel()
    var propertyLabel = UILabel()
    var itemsArray = [String]()
    var propertyArray = [String]()
    
    var yItem = 50
    var yProperty = 50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in 0..<(itemsArray.count) {
            createItemLabel(text: itemsArray[item])
            yItem += 50
        }
        
        for item in 0..<(propertyArray.count) {
            createPropertyLabel(text: propertyArray[item])
            yProperty += 50
        }
    }
    
    func createItemLabel(text: String) {
        itemLabel = UILabel(frame: CGRect(x: 10, y: yItem, width: 100, height: 50))
        itemLabel.text = text
        itemLabel.textAlignment = .left
        itemLabel.textColor = .black
        view.addSubview(itemLabel)
    }
    
    func createPropertyLabel(text: String) {
        propertyLabel = UILabel(frame: CGRect(x: 100, y: yProperty, width: 300, height: 50))
        propertyLabel.text = text
        propertyLabel.textAlignment = .left
        propertyLabel.textColor = .black
        propertyLabel.textAlignment = .center
        view.addSubview(propertyLabel)
    }
}
