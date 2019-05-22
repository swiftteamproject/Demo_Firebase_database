//
//  DetailVC.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 30/09/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit


class DetailVC: UIViewController {
    
    
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.alpha = 0
            tableView.layer.cornerRadius = 15
            tableView.layer.borderWidth = 1
            tableView.layer.borderColor = UIColor.black.cgColor
            tableView.layer.masksToBounds = true
        }
    }

    var arrays: DataObject?
    
    @IBOutlet weak var blur: UIVisualEffectView! {
        didSet {
            blur.alpha = 0
        }
    }
    var effect: UIVisualEffect!
    
    
    @IBOutlet weak var textFieldAddress: UITextField!
    var textAdress = ""
   
    var address = ""

    @IBOutlet weak var viewAdress: UIView! {
        didSet {
            viewAdress.layer.cornerRadius = 15
            viewAdress.layer.borderWidth = 1
            viewAdress.layer.borderColor = UIColor.black.cgColor
            viewAdress.alpha = 0
        }
    }
    @IBOutlet weak var viewCancelButton: UIView! {
        didSet {
            viewCancelButton.layer.cornerRadius = 15
            viewCancelButton.layer.borderWidth = 1
            viewCancelButton.layer.borderColor = UIColor.black.cgColor
            viewCancelButton.alpha = 0
        }
    }
    @IBOutlet weak var textAddress: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        effect = blur.effect
        blur.effect = nil


        let nib = UINib(nibName: "NomberZCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell1")
       
        let nib1 = UINib(nibName: "CityCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "cell6")
       
        let nib2 = UINib(nibName: "NumberDCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "cell2")
       
        let nib3 = UINib(nibName: "NumberP", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "cell3")
       
        let nib4 = UINib(nibName: "NumberECell", bundle: nil)
        tableView.register(nib4, forCellReuseIdentifier: "cell4")
        
        let nib5 = UINib(nibName: "NumberKCell", bundle: nil)
        tableView.register(nib5, forCellReuseIdentifier: "cell5")
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       animationIn()
        
    }

   
    
    func animationIn() {
        UIView.animate(withDuration: 0.7, animations: {
            self.blur.alpha = 1
            self.blur.effect = self.effect
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
               // self.mapsYandex.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.tableView.alpha = 1
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.4, animations: {
                        self.viewCancelButton.alpha = 1
                    }, completion: { (_) in
                       // print("success")
                    })
                })
            })
        }
    }
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func animationOut() {
        UIView.animate(withDuration: 0.9, animations: {
            self.viewCancelButton.alpha = 0
            self.tableView.alpha = 0
          //  self.mapsYandex.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
                self.blur.effect = nil
            }, completion: { (_) in
                self.dismiss(animated: false, completion: nil)
            })
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
       animationOut()
    }

    @IBAction func showMaps(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
           // self.mapsYandex.alpha = 1
        }
    }
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDefalt = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DefaltTableViewCell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! NomberZCell
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            cell.numberZ.text = arrays?.numberZakaza
            return cell
        } else if indexPath.row == 1 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath) as! CityCell
            cell.backgroundColor = UIColor.clear
            cell.city.text = arrays?.adress
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! NumberDCell
            cell.backgroundColor = UIColor.clear
            cell.numberD.text = arrays?.numberDom
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! NumberP
            cell.backgroundColor = UIColor.clear
            cell.numberP.text = arrays?.numberPod
            return cell
       } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! NumberECell
            cell.backgroundColor = UIColor.clear
            cell.numberE.text = arrays?.numberEtaga
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! NumberKCell
            cell.backgroundColor = UIColor.clear
            cell.numberK.text = arrays?.numberKvartiry
            return cell

        }
        return cellDefalt
    }
    
    
}
