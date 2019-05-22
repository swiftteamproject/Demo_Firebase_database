//
//  TableViewController.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 26/09/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TableViewController: UITableViewController {
    
    enum IndexColor: Int {
        case black = 0
        case white = 1
        case blue = 2
        case darkGray = 3
        case gray = 4
        case brow = 5
        case cyan = 6
        case lightGray = 7
        case purple = 8
        case orange = 9
    }
//    let colorss = UIColor.

    var editObject: DataObject?
    var sendIndexPath = IndexPath()
    var borderColor = UIColor()
    var array = Array<DataObject>()
    var ref: DatabaseReference!
    
    
    
    @IBOutlet var titleView: [UILabel]!
    @IBOutlet var seprators: [UIView]!
    @IBOutlet weak var addHistoryObjectData: UIBarButtonItem!
    @IBOutlet var detaiksView: [UIView]!
    @IBOutlet weak var viewDetail: UIView! {
        didSet {
            viewDetail.layer.cornerRadius = 15
            viewDetail.alpha = 0
            viewDetail.layer.borderWidth = 1
            // viewDetail.layer.borderColor = UIColor.white.cgColor
            //viewDetail.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    @IBOutlet weak var tital: UILabel! {
        didSet {
            tital.alpha = 0
        }
    }
    @IBOutlet weak var totalSumPodyema: UILabel! {
        didSet {
            totalSumPodyema.alpha = 0
        }
    }
    
    @IBOutlet weak var countTotalZakaz: UILabel! {
        didSet {
            countTotalZakaz.alpha = 0
        }
    }
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var endLabel: UILabel!
    
    let arrayColor = [UIColor.black, UIColor.white, UIColor.blue, UIColor.darkGray, UIColor.gray, UIColor.brown, UIColor.cyan, UIColor.lightGray, UIColor.magenta, UIColor.orange]
    var indexColor = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        addHistoryObjectData.isEnabled = false
        let dateStr = data()
        returnWeekDayHistory(date: dateStr)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.barTintColor = UIColor.brown
        tableView.separatorStyle = .none
        ref = Database.database().reference(withPath: "title").child("object")
        
        
      
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func dowloadDataTasc() {
        
    }
    
   
        
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//
        let userDefaultsGet = UserDefaults.standard
        guard let newText = userDefaultsGet.object(forKey: "numberColor") else { return }
        
        indexColor = newText as! Int
        title = data()
        
        viewDetail.backgroundColor = arrayColor[indexColor]
        
        ColorSetings.colorsVC(indexColor: indexColor, arrayTitleView: titleView, arraySeparators: seprators, viewDetail: viewDetail) { (color, arrayViews, arrayLabels) in
            self.borderColor = color
            self.titleView = arrayLabels
            self.seprators = arrayViews
        }
//
  
        
        startLabel.text = "C \(DateLabelWeeks.dateLabelWeeks()[0])"
        endLabel.text = "До \(DateLabelWeeks.dateLabelWeeks()[1])"
        
    
        ref.observe(.value) { (snapeshot) in
            var _tasks = Array<DataObject>()
            for i in snapeshot.children {
                let task = DataObject(snapeshot: i as! DataSnapshot)
                _tasks.append(task)
            }
            self.array = _tasks
            DispatchQueue.main.async {
                self.tableView.reloadData()
          
            if self.array.count > 0 {
                
                let count = self.array.count
                
                let sum = count * 500
                
                self.tital.text = String(sum)
                
                var sumP = 0
                for i in 0..<self.array.count {
                    if self.array[i].sumPodyema != "" {
                        let sumaP = Int(self.array[i].sumPodyema!)
                        sumP = sumP + sumaP!
                        
                    }
                }
                
                self.totalSumPodyema.text = String(sumP)
                UIView.animate(withDuration: 0.6, animations: {
                    self.viewDetail.alpha = 1
                    // self.viewDetail.layer.borderColor = UIColor.white.cgColor
                    //self.detaiksView[0].layer.borderColor = UIColor.green.cgColor
                }, completion: { (_) in
                    UIView.animate(withDuration: 1, animations: {
                        self.tital.alpha = 1
                        self.countTotalZakaz.alpha = 1
                        self.totalSumPodyema.alpha = 1
                        self.countTotalZakaz.text = "\(count)"
                        
                    })
                    
                })
                
                }
            }
        }
    }
    
    
    func countYearWeek() -> Int {
        let calendar = Calendar.current
        let date = Date()
        let interval = calendar.dateInterval(of: .year, for: date)!
        
        let days = calendar.dateComponents([.weekOfYear], from: interval.start, to: interval.end).weekOfYear!
        let text = days
        
        return text
    }
    
    func numberWeekOfYear() -> Int {
        let calendar = Calendar.current
        let date = Date()
        //let interval = calendar.dateInterval(of: .year, for: date)!
        let numberWeek = calendar.dateComponents([.weekOfYear], from: date)
        //let days = calendar.dateComponents([.weekOfYear], from: interval.start, to: interval.end).weekOfYear!
        let text = numberWeek.weekOfYear!
        
        return text
    }
    
    @IBAction func reloadData(_ sender: UIBarButtonItem) {
        var indexPath = [IndexPath]()
        
        for index in array.indices {
            let indexs = IndexPath(row: index, section: 0)
            indexPath.append(indexs)
        }
        
        tableView.reloadRows(at: indexPath, with: .bottom)
        
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    func data() -> String {
        var text = ""
        let currentDateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.string(from: currentDateTime)
        text = date
        return text
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return ViewForHeaderInSections.viewForHeaderInSections(array: array, tableView: tableView)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
        
    }
    
    
    func returnWeekDayText(array: Array<DataObject>, indexPath: IndexPath) -> String {
        var texts = ""
        let days = array[indexPath.row].data
        let componentsData = days.prefix(10)
        let text = componentsData
        let day = getDayOfWeek(String(text))
        if day == 1 {
            texts = "Воскресенье"
        } else if day == 2 {
            texts = "Понедельник"
        } else if day == 3 {
            texts = "Вторник"
        } else if day == 4 {
            texts = "Среда"
        } else if day == 5 {
            texts = "Четверг"
        } else if day == 6 {
            texts = "Пятница"
        } else if day == 7 {
            addHistoryObjectData.isEnabled = true
            texts = "Суббота"
        }
        return texts
    }
    
    func returnWeekDayHistory(date: String) {
        let days = date
        let componentsData = days.prefix(10)
        let text = componentsData
        let day = getDayOfWeek(String(text))
        if day == 1 {
            // texts = "Воскресенье"
            addHistoryObjectData.isEnabled = true
            
        } else if day == 2 {
            //  texts = "Понедельник"
            addHistoryObjectData.isEnabled = true
            
        } else if day == 3 {
            //  texts = "Вторник"
        } else if day == 4 {
            //  texts = "Среда"
        } else if day == 5 {
            //  texts = "Четверг"
        } else if day == 6 {
            //  texts = "Пятница"
        } else if day == 7 {
            addHistoryObjectData.isEnabled = true
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.weekday.text = returnWeekDayText(array: array, indexPath: indexPath)
        self.array.sort { $0.data < $1.data }

        
        ColorSetings.colorCell(indexColor: indexColor, cell: cell, arrayColor: arrayColor)
        
        let adress = "г.\(array[indexPath.row].adress) д\(array[indexPath.row].numberDom ?? "") п\(array[indexPath.row].numberPod ?? "") эт\(array[indexPath.row].numberEtaga ?? "") кв\(array[indexPath.row].numberKvartiry ?? "")"
        if array[indexPath.row].sumPodyema == "" {
            if indexColor == 0 {
                let image = UIImage(named: "lift_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 1 {
                let image = UIImage(named: "lift")
                cell.imageTypePodyem.image = image
                
                
            } else if indexColor == 2 {
                let image = UIImage(named: "lift_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 3 {
                let image = UIImage(named: "lift_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 4 {
                let image = UIImage(named: "lift_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 5 {
                let image = UIImage(named: "lift_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 6 {
                let image = UIImage(named: "lift")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 7 {
                let image = UIImage(named: "lift")
                cell.imageTypePodyem.image = image
            } else if indexColor == 8 {
                let image = UIImage(named: "lift")
                cell.imageTypePodyem.image = image
            } else if indexColor == 9 {
                let image = UIImage(named: "lift")
                cell.imageTypePodyem.image = image
            }
        } else {
            if indexColor == 0 {
                let image = UIImage(named: "Zanos_logo_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 1 {
                let image = UIImage(named: "Zanos_logo")
                cell.imageTypePodyem.image = image
                
                
            } else if indexColor == 2 {
                let image = UIImage(named: "Zanos_logo_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 3 {
                let image = UIImage(named: "Zanos_logo_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 4 {
                let image = UIImage(named: "Zanos_logo_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 5 {
                let image = UIImage(named: "Zanos_logo_w")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 6 {
                let image = UIImage(named: "Zanos_logo")
                cell.imageTypePodyem.image = image
                
            } else if indexColor == 7 {
                let image = UIImage(named: "Zanos_logo")
                cell.imageTypePodyem.image = image
            } else if indexColor == 8 {
                let image = UIImage(named: "Zanos_logo")
                cell.imageTypePodyem.image = image
            } else if indexColor == 9 {
                let image = UIImage(named: "Zanos_logo")
                cell.imageTypePodyem.image = image
            }
            
        }
        cell.viewCell.layer.borderColor = borderColor.cgColor
        cell.date.text = array[indexPath.row].data
        cell.adress.text = adress
        cell.sumPodyema.text = array[indexPath.row].sumPodyema
        
        let number = array[indexPath.row].numberZakaza.replacingOccurrences(of: "-", with: "/")
        cell.numberZakaza.text = number
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    func deleteObject(indexPath: IndexPath) {
        let task = array[indexPath.row]
        task.ref?.removeValue()
    }
    
    var deletIndex: IndexPath!
    
    
    
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let delete = UIContextualAction(style: .normal, title: "delete") { (action, view, success) in
            
            self.deletIndex = indexPath
            
            if self.deletIndex != nil {
                self.performSegue(withIdentifier: "deleteSegue", sender: nil)
            }
        }
        
        delete.image = UIImage(named: "deleteIcon")
        delete.backgroundColor = UIColor.black
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "edit") { (action, view, completion) in
            
            tableView.endEditing(true)
            self.editObject = self.array[indexPath.row]
            self.sendIndexPath = indexPath
            self.performSegue(withIdentifier: "editSegue", sender: nil)
            tableView.beginUpdates()
            tableView.endUpdates()
        }

        
        
        let images = UIImage(named: "edits")?.withRenderingMode(.automatic)
        edit.image = images
        edit.backgroundColor = UIColor.black
        
        return UISwipeActionsConfiguration(actions: [edit])
        
    }

@objc func names() {
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "segueTextSend":
            let dvc = segue.destination as! AddNewPositionViewController
            dvc.delegate = self
        case "detailMaps":
            let dvc = segue.destination as! DetailVC
            let index = tableView.indexPathForSelectedRow
            dvc.address = array[(index?.row)!].adress + " " + array[(index?.row)!].numberDom!
            dvc.textAdress =  "г." + array[(index?.row)!].adress + " " + "дом" + " " + " " + array[(index?.row)!].numberDom! + " " + "подъезд" + "№" + " " +  array[(index?.row)!].numberPod! + " " + "этаж" + "№" + " " +  array[(index?.row)!].numberEtaga! + " " + "квартира" + "№" + " " +  array[(index?.row)!].numberKvartiry!
            dvc.arrays = array[(index?.row)!]
        case "editSegue":
            let dvc = segue.destination as! EditViewController
            dvc.arrays = editObject
            dvc.indexPath = sendIndexPath
            dvc.delegate = self
        case "deleteSegue":
            let dvc = segue.destination as! DeleteViewController
            dvc.indexPath = deletIndex
            dvc.delegate = self
        case "showHistoryObject":
            let dvc = segue.destination as! HistoryViewController
        case "setings":
            let dvc = segue.destination as! SetingVC
            dvc.delegate = self
            
        default:
            break
        }
    }
    
    
    func addHistory() {
        
        let nameHistory = data()
        let textArray = nameHistory.replacingOccurrences(of: ".", with: "-")
        let text = textArray.replacingOccurrences(of: ",", with: "-")
        let textTwo = text.replacingOccurrences(of: " ", with: "-")
        ref = Database.database().reference(withPath: "title").child("history").child(String(textTwo.prefix(10)))
        for i in 0..<array.count {
            let dataSave = DataObject(weekOfYear: array[i].weekOfYear, data: array[i].data, adress: array[i].adress, numberDom: array[i].numberDom, numberPod: array[i].numberPod, numberEtaga: array[i].numberEtaga, numberKvartiry: array[i].numberKvartiry, numberZakaza: array[i].numberZakaza, sumPodyema: array[i].sumPodyema, lift: array[i].lift, podyem: array[i].podyem, detailText: array[i].detailText)
            
            
            let saveRef = ref.child("history \(i)")
            saveRef.setValue(["weekOfYear": dataSave.weekOfYear, "date": dataSave.data, "adress": dataSave.adress, "numberZ": dataSave.numberZakaza, "sumPodyema": dataSave.sumPodyema, "numberDom": dataSave.numberDom, "numberPod": dataSave.numberPod, "numberEtaga": dataSave.numberEtaga, "numberKvartiry": dataSave.numberKvartiry, "podyem": dataSave.podyem, "lift": dataSave.lift, "detailText": dataSave.detailText])
        }
        addHistoryObjectData.isEnabled = true
    }
    
    @IBAction func addHistoryItems(_ sender: UIBarButtonItem) {
        
        
        performSegue(withIdentifier: "showHistoryObject", sender: nil)
        
    }
    
    
    @IBAction func addHistoryObjectAction(_ sender: UIBarButtonItem) {
        
        addHistory()
        
        
    }
 
    
}



extension TableViewController: AddNewPosition {
    func newElements(numberZakaze: String, adress: String, numberDom: String, numberPod: String, numberEtaga: String, numberKvartiry: String, podyem: Bool, lift: Bool, sumPodyema: String?, editType: Bool, detailText: String?) {
        
        
        
        let date = data()
        let textArray = numberZakaze.replacingOccurrences(of: "/", with: "-")
        let weekOfYear = numberWeekOfYear()
        
        let tasks = DataObject(weekOfYear: weekOfYear, data: date, adress: adress, numberDom: numberDom, numberPod: numberPod, numberEtaga: numberEtaga, numberKvartiry: numberKvartiry, numberZakaza: numberZakaze, sumPodyema: sumPodyema, lift: lift, podyem: podyem, detailText: detailText)
        
        let taskRef = self.ref.child(textArray.lowercased())
        taskRef.setValue(["weekOfYear": tasks.weekOfYear, "date": tasks.data, "adress": tasks.adress, "numberZ": tasks.numberZakaza, "sumPodyema": tasks.sumPodyema, "numberDom": tasks.numberDom, "numberPod": tasks.numberPod, "numberEtaga": tasks.numberEtaga, "numberKvartiry": tasks.numberKvartiry, "podyem": tasks.podyem, "lift": tasks.lift, "detailText": tasks.detailText])
        tableView.reloadData()
    }
    
    
}



extension TableViewController: EditObject {
    func editElements(numberZakaze: String?, adress: String?, numberDom: String?, numberPod: String?, numberEtaga: String?, numberKvartiry: String?, podyem: Bool?, lift: Bool?, sumPodyema: String?, index: IndexPath!) {
        
        
        if numberZakaze != "" {
            let object = array[index.row]
            object.ref?.updateChildValues(["numberZ": numberZakaze!])
            
        }
        if adress != "" {
            let object = array[index.row]
            object.ref?.updateChildValues(["adress": adress!])
        }
        if numberDom != "" {
            let object = array[index.row]
            object.ref?.updateChildValues(["numberDom": numberDom!])
        }
        if numberPod != "" {
            let object = array[index.row]
            object.ref?.updateChildValues(["numberPod": numberPod!])
        }
        if numberEtaga != "" {
            let object = array[index.row]
            object.ref?.updateChildValues(["numberEtaga": numberEtaga!])
        }
        if numberKvartiry != "" {
            let object = array[index.row]
            object.ref?.updateChildValues(["numberKvartiry": numberKvartiry!])
        }
        if sumPodyema != "" {
            if sumPodyema == "0" {
                let del = array[index.row]
                del.ref?.updateChildValues(["sumPodyema": ""])
            } else {
                let object = array[index.row]
                object.ref?.updateChildValues(["sumPodyema": sumPodyema!])
            }
        }
    }
}
extension TableViewController: DeleteObject {
    func deleteElements(indexPathRow: IndexPath) {
        self.deleteObject(indexPath: indexPathRow)
        print(indexPathRow)
        self.tableView.reloadData()
        let deletObject = array[indexPathRow.row]
        deletObject.ref?.removeValue()
    }
    
    
}
extension TableViewController: Seting {
    func newElements(numberColor: Int) {
        indexColor = numberColor
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}
