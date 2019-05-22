//
//  AllertController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 30/03/2019.
//  Copyright © 2019 Артем Валерьевич. All rights reserved.
//

import Foundation
import UIKit

class AlertControllerT {
    public init() {}
    
    static func addAlert(in vc: UIViewController, completion: @escaping(String, Int?, String?, String?) -> Void) {
        let alert = UIAlertController(title: "new element's", message: "", preferredStyle: .alert)
        alert.addTextField { (nameTF) in
            nameTF.placeholder = "name"
        }
        alert.addTextField { (typeTF) in
            typeTF.placeholder = "type"
        }
        alert.addTextField { (locationTF) in
            locationTF.placeholder = "location"
        }
        alert.addTextField { (objectTF) in
            objectTF.placeholder = "object"
        }
        let action = UIAlertAction(title: "save", style: .default) { (_) in
            guard let nameString = alert.textFields?.first?.text,
                let typeString = alert.textFields?[1].text,
                let locationString = alert.textFields?[2].text,
                let objectString = alert.textFields?.last?.text
                else { return }
            let type = typeString == "" ? nil : Int(typeString)
            let location = locationString == "" ? nil : locationString
            let object = objectString == "" ? nil : objectString
           
            // присвоение в escaping!!!!
            completion(nameString, type, location, object)
//            completion(nameString, type, location, object)
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    static func testing(in text: [String], completion: @escaping(String, String?, String?, String?) -> Void) {
        let textOne = text[0]
        let textTwo = text[1]
        let textThree = text[2]
        let textFour = text[3]
        completion(textOne, textTwo, textThree, textFour)
    }
    
}
