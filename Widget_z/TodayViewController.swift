//
//  TodayViewController.swift
//  Widget_z
//
//  Created by Артем Валерьевич on 05/11/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var countZ: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = UserDefaults()

        guard let one = user.string(forKey: "count") else { return }

        if one != nil {
            countZ.text = one
            
        } else {
            countZ.text = "test"
        }
        
    }
    

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {

        completionHandler(NCUpdateResult.newData)
    }
    
}
