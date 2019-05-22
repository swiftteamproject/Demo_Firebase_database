//
//  ViewForHeaderInSection.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 31/03/2019.
//  Copyright © 2019 Артем Валерьевич. All rights reserved.
//

import UIKit

class ViewForHeaderInSections {
    public init() {}
    
    
    static func viewForHeaderInSections(array: Array<DataObject>, tableView: UITableView) -> UIView? {
        
        let countArray = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        var nameZak = ""
        if array.count >= 1 {
            switch array.count {
            case 1:
                nameZak = "заказ"
                let userDefaults = UserDefaults.standard
                userDefaults.set(array.count, forKey: "text")
            case 2, 3, 4:
                nameZak = "заказа"
                let userDefaults = UserDefaults.standard
                userDefaults.set(array.count, forKey: "text")
            case 5..<99:
                nameZak = "заказов"
                let userDefaults = UserDefaults.standard
                userDefaults.set(array.count, forKey: "text")
            default:
                nameZak = ""
                let userDefaults = UserDefaults.standard
                userDefaults.set("0", forKey: "text")
            }
        }
        if array.count <= 0 {
            countArray.text = "Нет заказов!!!"
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
            countArray.text = "Всего \(array.count) \(nameZak)"
        }
        countArray.font = UIFont.systemFont(ofSize: 40)
        countArray.textAlignment = .center
        countArray.textColor = UIColor.white
        countArray.backgroundColor = UIColor.black
        
        
        
        return countArray
    }
}
