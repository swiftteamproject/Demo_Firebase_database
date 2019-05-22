//
//  AddNewPositionViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 21/09/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit

protocol AddNewPosition {
    func newElements(numberZakaze: String, adress: String, numberDom: String, numberPod: String, numberEtaga: String, numberKvartiry: String, podyem: Bool, lift: Bool, sumPodyema: String?, editType: Bool, detailText: String?)
}
protocol AddNewElement {
    func newElements(text: String)
}

class AddNewPositionViewController: UIViewController {
    
    var delegate: AddNewPosition?
    var effect: UIVisualEffect!
    
    @IBOutlet weak var detailTextF: UITextField!
    @IBOutlet weak var viewAdd: UIView! {
        didSet {
            viewAdd.layer.cornerRadius = 13
            viewAdd.layer.borderWidth = 1
            viewAdd.layer.borderColor = UIColor.black.cgColor
            viewAdd.alpha = 0
        }
    }
    
    var arrayView = [UIView]()
    @IBOutlet weak var okOutlet: UIButton!
    @IBOutlet weak var imageLift: UIImageView!
    @IBOutlet weak var imagePegkom: UIImageView!
    
    @IBOutlet weak var nemberZakaza: UITextField! {
        didSet {
            nemberZakaza.transform = CGAffineTransform(translationX: -200, y: -500)
        }
    }
    @IBOutlet weak var adress: UITextField! {
        didSet {
            adress.transform = CGAffineTransform(translationX: -4000, y: 650)
        }
    }
    
    @IBOutlet weak var numberDom: UITextField! {
        didSet {
            numberDom.transform = CGAffineTransform(translationX: 0, y: 900)
        }
    }
    // numberDom numberPod numberEtaga numberKvartiry
    @IBOutlet weak var numberPod: UITextField! {
        didSet {
            numberPod.transform = CGAffineTransform(translationX: 400, y: 750)
        }
    }
    
    @IBOutlet weak var numberEtaga: UITextField! {
        didSet {
            numberEtaga.transform = CGAffineTransform(translationX: -600, y: 0)
        }
    }
    
    @IBOutlet weak var numberKvartiry: UITextField! {
        didSet {
            numberKvartiry.transform = CGAffineTransform(translationX: 350, y: 0)
        }
    }
    
    @IBOutlet weak var podOutlet: UISwitch! {
        didSet {
            podOutlet.transform = CGAffineTransform(scaleX: 0.0000001, y: 0.0000001)
        }
    }
    @IBOutlet weak var liftOutlet: UISwitch! {
        didSet {
            liftOutlet.transform = CGAffineTransform(scaleX: 0.0000001, y: 0.0000001)
        }
    }
    
    
    
    @IBOutlet weak var textSumPodyema: UILabel!
    @IBOutlet weak var sumPodyema: UITextField!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = blurEffect.effect
        blurEffect.effect = nil
        
        textSumPodyema.alpha = 0
        sumPodyema.alpha = 0
        imageLift.alpha = 0
        imagePegkom.alpha = 0
        
        nemberZakaza.delegate = self
        nemberZakaza.returnKeyType = .next
        adress.delegate = self
        adress.keyboardType = .emailAddress
        numberDom.returnKeyType = .next
        numberDom.keyboardType = .numbersAndPunctuation
        numberDom.delegate = self
        numberPod.keyboardType = .numberPad
        numberPod.returnKeyType = .next
        numberPod.delegate = self
        numberEtaga.keyboardType = .numberPad
        numberEtaga.returnKeyType = .next
        numberEtaga.delegate = self
        numberKvartiry.keyboardType = .numberPad
        numberKvartiry.returnKeyType = .continue
        numberKvartiry.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationIn()
    }
    
    func animationIn() {
        UIView.animate(withDuration: 0.4, animations: {
            
            self.blurEffect.effect = self.effect
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
                self.viewAdd.alpha = 1
            }, completion: { (_) in
                
            UIView.animate(withDuration: 0.8, animations: {
                self.nemberZakaza.transform = CGAffineTransform.identity
                self.adress.transform = CGAffineTransform.identity
                self.numberDom.transform = CGAffineTransform.identity
                self.numberPod.transform = CGAffineTransform.identity
                self.numberEtaga.transform = CGAffineTransform.identity
                self.numberKvartiry.transform = CGAffineTransform.identity
                self.podOutlet.transform = CGAffineTransform.identity
                self.liftOutlet.transform = CGAffineTransform.identity
            })
            })
        }
        
        
    }
    // возврат назад
    func animationOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.liftOutlet.transform = CGAffineTransform(scaleX: 0.0000001, y: 0.0000001)
             self.podOutlet.transform = CGAffineTransform(scaleX: 0.0000001, y: 0.0000001)
            self.numberKvartiry.transform = CGAffineTransform(translationX: 350, y: 0)
            self.numberEtaga.transform = CGAffineTransform(translationX: -600, y: 0)
            self.numberPod.transform = CGAffineTransform(translationX: 400, y: 750)
            self.numberDom.transform = CGAffineTransform(translationX: 0, y: 900)
            self.adress.transform = CGAffineTransform(translationX: -4000, y: 650)
            self.nemberZakaza.transform = CGAffineTransform(translationX: -200, y: -500)
            self.viewAdd.alpha = 0
        }) { (_) in
            
            UIView.animate(withDuration: 0.4, animations: {
                self.blurEffect.effect = nil
            }, completion: { (_) in
                
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
    
    func showTextFieldIn() {
        UIView.animate(withDuration: 0.8) {
            self.textSumPodyema.alpha = 1
            self.sumPodyema.alpha = 1
            self.imagePegkom.alpha = 1
        }
        
    }
    func hiddenTextFieldOut() {
        UIView.animate(withDuration: 0.8) {
            
            self.textSumPodyema.alpha = 0
            self.sumPodyema.alpha = 0
            self.imagePegkom.alpha = 0
        }
        
    }
    
    
    func showImage() {
        UIView.animate(withDuration: 0.6) {
            self.imageLift.alpha = 1
        }
    }
    
    func hiddenImage() {
        UIView.animate(withDuration: 0.6) {
            self.imageLift.alpha = 0
        }
    }
    @IBAction func liftAction(_ sender: UISwitch) {
        if sender.isOn == true {
            showImage()
        } else {
            hiddenImage()
        }
    }
    
    @IBAction func podyemAction(_ sender: UISwitch) {
        if sender.isOn == true {
            showTextFieldIn()
            
        } else {
            hiddenTextFieldOut()
            
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
    }
    @IBAction func backSender(_ sender: UIButton) {
       // print("goiejgoijgsoie")
        animationOut()
    }
    
    func saveData() {
        if nemberZakaza.text == "" {
            
        } else if adress.text == ""{
            
        } else {
            
            
            let numberakaza = nemberZakaza.text
            let adres = adress.text
            
            let _numberDom = numberDom.text
            let _numberPod = numberPod.text
            let _numberEtaga = numberEtaga.text
            let _numberKvartiry = numberKvartiry.text
            
            
            
            let pod = podOutlet.isOn
            let lift = liftOutlet.isOn
            let sum = sumPodyema.text
            let detail = detailTextF.text
            
            delegate?.newElements(numberZakaze: numberakaza!, adress: adres!, numberDom: _numberDom!, numberPod: _numberPod!, numberEtaga: _numberEtaga!, numberKvartiry: _numberKvartiry!, podyem: pod, lift: lift, sumPodyema: sum, editType: true, detailText: detail)
            animationOut()
        }
    }
    
    @IBAction func doneAction(_ sender: UIButton) {

        if nemberZakaza.text == "" {
            
        } else if adress.text == ""{
            
        } else {
            
            
            let numberakaza = nemberZakaza.text
            let adres = adress.text
            
            let _numberDom = numberDom.text
            let _numberPod = numberPod.text
            let _numberEtaga = numberEtaga.text
            let _numberKvartiry = numberKvartiry.text
            
            
            
            let pod = podOutlet.isOn
            let lift = liftOutlet.isOn
            let sum = sumPodyema.text
            let detail = detailTextF.text
            
            delegate?.newElements(numberZakaze: numberakaza!, adress: adres!, numberDom: _numberDom!, numberPod: _numberPod!, numberEtaga: _numberEtaga!, numberKvartiry: _numberKvartiry!, podyem: pod, lift: lift, sumPodyema: sum, editType: true, detailText: detail)
            animationOut()
        }
    }
    
}

extension AddNewPositionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nemberZakaza {
            adress.becomeFirstResponder()
        } else if textField == adress {
            numberDom.becomeFirstResponder()
        } else if textField == numberDom {
            numberPod.becomeFirstResponder()
        } else if textField == numberPod {
            numberEtaga.becomeFirstResponder()
        } else if textField == numberEtaga {
            numberKvartiry.becomeFirstResponder()

        } else if textField == numberKvartiry {
            view.endEditing(true)
            return true
        }
        return false
    }
}
