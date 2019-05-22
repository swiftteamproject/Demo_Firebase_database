//
//  SetingVC.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 14/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
protocol Seting {
    func newElements(numberColor: Int)
}
class SetingVC: UIViewController {

    let arrayColor = [UIColor.black, UIColor.white, UIColor.blue, UIColor.darkGray, UIColor.gray, UIColor.brown, UIColor.cyan, UIColor.lightGray, UIColor.magenta, UIColor.orange]
    var delegate: Seting?
    var indexColors = 0
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
    print("save object to userDefalts")
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        delegate?.newElements(numberColor: indexColors)
    }
   

}

extension SetingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = arrayColor[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexColors = indexPath.row
        let indexColor = indexPath.row
        let userDefalts = UserDefaults.standard
        userDefalts.set(indexColor, forKey: "numberColor")
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
