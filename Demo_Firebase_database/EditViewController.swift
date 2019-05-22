//
//  EditViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 06/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
import Firebase

protocol EditObject {
    func editElements(numberZakaze: String?, adress: String?, numberDom: String?, numberPod: String?, numberEtaga: String?, numberKvartiry: String?, podyem: Bool?, lift: Bool?, sumPodyema: String?, index: IndexPath!)
}

class EditViewController: UIViewController {
    
    var delegate: EditObject?
    
    @IBOutlet weak var numberZLabel: UILabel!
    @IBOutlet weak var numberZ: UITextField!
    @IBOutlet weak var cityLocationLabel: UILabel!
    @IBOutlet weak var cityLocation: UITextField!
    @IBOutlet weak var numberDLabel: UILabel!
    @IBOutlet weak var numberD: UITextField!
    @IBOutlet weak var numberPLabel: UILabel!
    @IBOutlet weak var numberP: UITextField!
    @IBOutlet weak var numberELabel: UILabel!
    @IBOutlet weak var numberE: UITextField!
    @IBOutlet weak var numberKLabel: UILabel!
    @IBOutlet weak var numberK: UITextField!
    @IBOutlet weak var podyemLabel: UILabel!
    @IBOutlet weak var sumPodyem: UITextField!
    @IBOutlet weak var podyem: UISwitch!
    @IBOutlet weak var liftOutlet: UILabel!
    @IBOutlet weak var lift: UISwitch!
    @IBOutlet weak var saveButtonOutlet: UIButton! {
        didSet {
            saveButtonOutlet.layer.cornerRadius = 7
            saveButtonOutlet.layer.borderWidth = 1
            saveButtonOutlet.layer.borderColor = UIColor.black.cgColor
            saveButtonOutlet.layer.masksToBounds = true
        }
    }
    
    
    @IBOutlet weak var viewEditObject: UIView! {
        didSet {
            viewEditObject.transform = CGAffineTransform(scaleX: 10, y: 10)
            viewEditObject.layer.cornerRadius = 15
            viewEditObject.layer.borderWidth = 1
            viewEditObject.layer.borderColor = UIColor.black.cgColor
            viewEditObject.layer.masksToBounds = true
            viewEditObject.alpha = 0
        }
    }
    
    var arrays: DataObject?
    var indexPath = IndexPath()
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = blurEffect.effect
        blurEffect.effect = nil
        
        numberZLabel.alpha = 0
        numberZ.alpha = 0
        
        cityLocationLabel.alpha = 0
        cityLocation.alpha = 0
        numberDLabel.alpha = 0
        numberD.alpha = 0
        numberPLabel.alpha = 0
        numberP.alpha = 0
        numberELabel.alpha = 0
        numberE.alpha = 0
        numberKLabel.alpha = 0
        numberK.alpha = 0
        podyemLabel.alpha = 0
        sumPodyem.alpha = 0
        podyem.alpha = 0
        liftOutlet.alpha = 0
        lift.alpha = 0
        saveButtonOutlet.alpha = 0
        
        
        
        
        numberZ.placeholder = arrays?.numberZakaza
        cityLocation.placeholder = arrays?.adress
        numberD.placeholder = arrays?.numberDom
        numberP.placeholder = arrays?.numberPod
        numberE.placeholder = arrays?.numberEtaga
        numberK.placeholder = arrays?.numberKvartiry
        sumPodyem.placeholder = arrays?.sumPodyema
        if arrays?.sumPodyema == "" {
            lift.isOn = true
            podyem.isOn = false
        } else {
            lift.isOn = false
            podyem.isOn = true
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationIn()
    }
    
    func animationIn() {
        UIView.animate(withDuration: 0.3, animations: {
            self.blurEffect.effect = self.effect
        }) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                self.viewEditObject.transform = CGAffineTransform.identity
                self.viewEditObject.alpha = 1
            }, completion: { (_) in
                self.animations()
            })
        }
        
    }
    
    func animationOut() {
        delegate?.editElements(numberZakaze: numberZ.text, adress: cityLocation.text, numberDom: numberD.text, numberPod: numberP.text, numberEtaga: numberE.text, numberKvartiry: numberK.text, podyem: podyem.isOn, lift: lift.isOn, sumPodyema: sumPodyem.text, index: indexPath)
        UIView.animate(withDuration: 0.4, animations: {
            self.viewEditObject.transform = CGAffineTransform(scaleX: 10, y: 10)
            self.viewEditObject.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
                self.blurEffect.alpha = 0
                self.blurEffect.effect = nil
            }, completion: { (_) in
                self.dismiss(animated: false, completion: nil)
            })
        }
        
    }
    
    func animations() {
        let arrayElements = [numberZLabel,
                             numberZ,
                             cityLocationLabel, cityLocation, numberDLabel, numberD, numberPLabel, numberP, numberELabel, numberE, numberKLabel, numberK, podyemLabel, sumPodyem, podyem, liftOutlet, lift, saveButtonOutlet]
        
        for (index, button) in arrayElements.enumerated() {
            let delay = 0.1 * Double(index)
            let delayT = delay / 2
            UIView.animate(withDuration: 0.4, delay: delayT, animations: {
                button?.alpha = 1
            }, completion: nil)
        }
    }
    
    
    
    @IBAction func cancel(_ sender: UIButton) {
        
        animationOut()
    }
    
    
}
extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == numberZ {
            cityLocation.becomeFirstResponder()
        } else if textField == cityLocation {
            numberD.becomeFirstResponder()
        } else if textField == numberD {
            numberP.becomeFirstResponder()
        } else if textField == numberP {
            numberE.becomeFirstResponder()
        } else if textField == numberE {
            numberK.becomeFirstResponder()
        } else if textField == numberK {
            view.endEditing(true)
            return true
        }
        return false
    }
}
