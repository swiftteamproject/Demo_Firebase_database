//
//  Table.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 26/09/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit

class Table: UITableView {

    @IBOutlet weak var hed: NSLayoutConstraint!
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else { return }
        let offsetY = -contentOffset.y
        
        hed.constant = max(header.bounds.height, header.bounds.height - 50 + offsetY)
    }
}
