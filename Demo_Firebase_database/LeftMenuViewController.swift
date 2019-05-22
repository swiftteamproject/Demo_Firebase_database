//
//  LeftMenuViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 11/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {
    
    @IBOutlet weak var viewLeft: UIView! {
        didSet {
            viewLeft.layer.borderWidth = 1
            viewLeft.layer.cornerRadius = 15
            viewLeft.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
           // viewLeft.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var visualEffect: UIVisualEffectView! {
        didSet {
            visualEffect.alpha = 0
        }
    }
    
    var effect: UIVisualEffect!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffect.effect
        visualEffect.effect = nil
        
        viewLeft.transform = CGAffineTransform(translationX: -225, y: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.4, animations: {
            self.visualEffect.effect = self.effect
            self.visualEffect.alpha = 0.2
        }) { (_) in
            
            UIView.animate(withDuration: 0.2, animations: {
                self.visualEffect.alpha = 0.5
                self.viewLeft.transform = CGAffineTransform.identity
            }) { (_) in
               // print("success")
            }
        }
    }
    @IBAction func cancel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4, animations: {
            self.viewLeft.transform = CGAffineTransform(translationX: -225, y: 0)
            self.visualEffect.alpha = 0.1
        }) { (_) in

        UIView.animate(withDuration: 0.2, animations: {
            self.visualEffect.effect = nil
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
}
