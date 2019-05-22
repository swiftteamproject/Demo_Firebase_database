//
//  HistoryViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 11/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    // var arrayHistory: [String: [DataObject]] = [String[DataObject]]
    
    var ref: DatabaseReference!
    var arrays = [String: [DataObject]]()
    var countCell = [0]
    var buttonName = [String]()
    
    internal var showObject: IndexPath? {
        didSet {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    internal var selectedIndexPath: IndexPath? {
        didSet{
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testing(text: "test") { (json) in
            print(json)
        }
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let nib = UINib(nibName: "HistoryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        ref = Database.database().reference(withPath: "title").child("history")
        
        ref.observe(.value) { (snapshot) in
            
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
                self.download(child: rest.key)
            }
        }
    }
    
    
    
    @objc func buttonTap(_ sender: UIButton) {
       // print(sender.tag)
        if countCell[sender.tag] == 0 {
            countCell[sender.tag] = (arrays[Array(arrays)[sender.tag].key]?.count)!
            buttonName[sender.tag] = "hidden"
        } else {
            countCell[sender.tag] = 0
            buttonName[sender.tag] = "show"
        }
        tableView.reloadData()
    }
    
    
    func download(child: String) {
        ref = Database.database().reference(withPath: "title").child("history").child(child)
        
        ref.observe(.value) { (snapshot) in
            var _tasks = Array<DataObject>()
            for i in snapshot.children {
                let task = DataObject(snapeshot: i as! DataSnapshot)
                _tasks.append(task)
            }
            let dataArray: [DataObject] = _tasks
//            self.showObject.updateValue([Bool](repeating: true, count: _tasks.count), forKey: child)
                //= [Bool](repeating: true, count: _tasks.count)
            self.arrays.updateValue(dataArray, forKey: child)
            DispatchQueue.main.async {
                self.countCell = []
                self.buttonName = []
                for _ in 0..<self.arrays.count {
                    self.countCell.append(0)
                    self.buttonName.append("show")
                }
                self.tableView.reloadData()
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func scrollAddImages(arrayImage: Array<String>, contentView: UIView) -> UIScrollView {
        // create scroll View
        var scrollView = UIScrollView()
        
        // size image == size cell in table View
        var imageRect = contentView.bounds
        
        // scroll View size == cell size in the View table
        let scrollRect = contentView.bounds
        
        // number of images in the array
        let countImage = CGFloat(arrayImage.count)
        
        // size width scroll view
        
        // image array cycle
        for i in 0..<arrayImage.count {
            
            // image number one
            if i == 0 {
                // size scroll view
                scrollView = UIScrollView(frame: scrollRect)
                
                // create image
//                let imageOne = UIImage(named: arrayImage[i])
                let labelA = UILabel()
                labelA.text = arrays[Array(arrays)[0].key]![0].adress
                // frame image to display
//                let oneImage = self.newImageView(paramImage: imageOne!, paramFrame: imageRect)
//                let object = self.arrays
                
                // add our image to scroll
               // scrollView.addSubview(oneImage)
                
                // if the image number is not one
            } else {
                
                
                imageRect.origin.x += imageRect.size.width
                //
//                let images = UIImage(named: arrayImage[i])
//                let tImage = newImageView(paramImage: images!, paramFrame: imageRect)
//                scrollView.addSubview(tImage)
                
            }
            scrollView.contentSize = CGSize(width: scrollRect.size.width * countImage, height: scrollRect.size.height)
        }
        return scrollView
        
    }
}
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrays.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(arrays)[section].key
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.white
        var zac = ""
        if (arrays[Array(arrays)[section].key]?.count)! >= 1 {
            switch (arrays[Array(arrays)[section].key]?.count)! {
            case 1:
                zac = "заказ"
            case 2, 3, 4:
                zac = "заказа"
            case 5..<99:
                zac = "заказов"
            default:
                zac = ""
            }
        }
        title.text = "\(Array(arrays)[section].key) Всего  \((arrays[Array(arrays)[section].key]?.count)!) \(zac)"
        headerView.addSubview(title)
       
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.setTitle(buttonName[section], for: .normal)
        button.tag = section
        button.addTarget(self, action: #selector(buttonTap(_:)) , for: .touchUpInside)
        headerView.addSubview(button)
        
        
        var headerViews = Dictionary<String, UIView>()
        headerViews["title"] = title
        headerViews["button"] = button
        
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[title]-[button]-15-|", options: [], metrics: nil, views: headerViews))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-|", options: [], metrics: nil, views: headerViews))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]-|", options: [], metrics: nil, views: headerViews))
        
        return headerView
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor.black
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrays.count >= 1 {
            return countCell[section]
            
        } else {
            return 0
        }
    }
    
    func testing(text: String, complition: @escaping (String) ->()) {
    
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryCell
        // cell.backgroundColor = UIColor.black
       
        cell.textLabel?.numberOfLines = 0
        if indexPath != showObject {
            cell.address.alpha = 0
            cell.date.alpha = 0
            cell.sumP.alpha = 0
        } else {
            cell.address.alpha = 1
            cell.date.alpha = 1
            cell.sumP.alpha = 1
        }
        
        cell.numberZ.text = arrays[Array(arrays)[indexPath.section].key]![indexPath.row].numberZakaza
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detailStory", sender: nil)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == self.selectedIndexPath {
            let size = 200

            UIView.animate(withDuration: 0.9, animations: {
                self.showObject = indexPath
            }) { (_) in
                print("succwуы")
            }
            return CGFloat(size)
        } else {
            self.showObject = nil
            return 50
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailStory" {
            let dvc = segue.destination as! DetailVC
            let index = tableView.indexPathForSelectedRow
            dvc.address = arrays[Array(arrays)[(index?.section)!].key]![(index?.row)!].adress + " " + arrays[Array(arrays)[(index?.section)!].key]![(index?.row)!].numberDom!
            dvc.textAdress = """
            "г." + array[(index?.row)!].adress + " " + "дом" + " " + " " + array[(index?.row)!].numberDom! + " " + "подъезд" + "№" + " " +  array[(index?.row)!].numberPod! + " " + "этаж" + "№" + " " +  array[(index?.row)!].numberEtaga! + " " + "квартира" + "№" + "
            " +  array[(index?.row)!].numberKvartiry!
            """
            dvc.arrays = arrays[Array(arrays)[index!.section].key]![(index?.row)!]
    }
    
}
}
