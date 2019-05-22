//
//  StatisticViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 22/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
//import MKRingProgressView

class StatisticViewController: UIViewController {

    @IBOutlet weak var viewCircle: UIView!

    var count = 0
    
    var value: CGFloat = 0.0
    var textProcent = ""
    
    
    var durations = 0
    let shnapeLayer = CAShapeLayer()
    //let progressBar = VVCircleProgressBar()

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }

    @IBAction func position(_ sender: UISlider) {
    }

    @IBAction func countZ(_ sender: UIStepper) {

    }
}
