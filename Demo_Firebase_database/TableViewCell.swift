//
//  TableViewCell.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 20/09/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var viewSeparator: UIView!
    @IBOutlet weak var imageTypePodyem: UIImageView!
    @IBOutlet weak var viewCell: UIView! {
        didSet {
            viewCell.layer.cornerRadius = 15
            viewCell.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var sumPodyema: UILabel!
    @IBOutlet weak var weekday: UILabel!
    @IBOutlet weak var numberZakaza: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var adress: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
