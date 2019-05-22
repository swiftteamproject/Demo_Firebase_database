//
//  HistoryCell.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 14/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView! {
        didSet {
            viewCell.layer.cornerRadius = 12
            viewCell.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var numberZ: UILabel!
    @IBOutlet weak var address: UILabel! {
        didSet {
            address.alpha = 0
        }
    }
    @IBOutlet weak var date: UILabel! {
        didSet {
            date.alpha = 0
        }
    }
    @IBOutlet weak var sumP: UILabel! {
        didSet {
            sumP.alpha = 0
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
