//
//  DeleteViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 09/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
protocol DeleteObject {
    func deleteElements(indexPathRow: IndexPath)
}
class DeleteViewController: UIViewController {

    
    var effect: UIVisualEffect!
    var delegate: DeleteObject?
    var indexPath: IndexPath!
    
    @IBOutlet weak var titleOutlet: UILabel! {
        didSet {
            titleOutlet.layer.cornerRadius = 10
            titleOutlet.layer.borderWidth = 1
            titleOutlet.layer.borderColor = UIColor.black.cgColor
            titleOutlet.layer.masksToBounds = true
            titleOutlet.alpha = 0
        }
    }
    @IBOutlet weak var deleteOutlete: UIButton! {
        didSet {
            deleteOutlete.layer.cornerRadius = 5
            deleteOutlete.layer.borderWidth = 1
            deleteOutlete.layer.borderColor = UIColor.black.cgColor
            deleteOutlete.layer.masksToBounds = true
            deleteOutlete.alpha = 0
        }
    }
    @IBOutlet weak var cancelOutlet: UIButton! {
        didSet {
            cancelOutlet.layer.cornerRadius = 5
            cancelOutlet.layer.borderWidth = 1
            cancelOutlet.layer.borderColor = UIColor.black.cgColor
            cancelOutlet.layer.masksToBounds = true
            cancelOutlet.alpha = 0
        }
    }
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = blurEffect.effect
        blurEffect.effect = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationIn()
    }
    
    func animationIn() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blurEffect.effect = self.effect
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
                self.titleOutlet.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.cancelOutlet.alpha = 1
                    self.deleteOutlete.alpha = 1
                })
            })
        }
        
    }
    
    func animationOut() {
        UIView.animate(withDuration: 0.5, animations: {
            self.cancelOutlet.alpha = 0
            self.deleteOutlete.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
                self.titleOutlet.alpha = 0
            }, completion: { (_) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.blurEffect.alpha = 0
                    self.blurEffect.effect = self.effect
                }, completion: { (_) in
                    self.dismiss(animated: false, completion: nil)
                })
            })
        }
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteElements(indexPathRow: indexPath)
        animationOut()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        animationOut()
    }
    

}
