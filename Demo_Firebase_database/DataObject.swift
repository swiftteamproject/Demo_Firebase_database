//
//  DataObject.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 06/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import Foundation
import Firebase

struct DataObject {
    let weekOfYear: Int?
    let data: String
    let adress: String
    let numberZakaza: String
    let sumPodyema: String?
    let lift: Bool?
    let podyem: Bool?
    let ref: DatabaseReference?
    
    let numberDom: String?
    let numberPod: String?
    let numberEtaga: String?
    let numberKvartiry: String?
    
    let detailText: String?
    
    init(weekOfYear: Int?, data: String, adress: String, numberDom: String?, numberPod: String?, numberEtaga: String?, numberKvartiry: String?, numberZakaza: String, sumPodyema: String?, lift: Bool?, podyem: Bool?, detailText: String?) {
        self.weekOfYear = weekOfYear
        self.numberZakaza = numberZakaza
        self.adress = adress
        self.numberDom = numberDom
        self.numberPod = numberPod
        self.numberEtaga = numberEtaga
        self.numberKvartiry = numberKvartiry
        self.data = data
        self.sumPodyema = sumPodyema
        self.lift = lift
        self.podyem = podyem
        self.detailText = detailText
        self.ref = nil
    }
    
    init(snapeshot: DataSnapshot) {
        let snapeshotValue = snapeshot.value as! [String: AnyObject]
        weekOfYear = snapeshotValue["weekOfyear"] as? Int
        data = snapeshotValue["date"] as! String
        adress = snapeshotValue["adress"] as! String
        numberZakaza = snapeshotValue["numberZ"] as! String
        sumPodyema = snapeshotValue["sumPodyema"] as? String
        numberDom = snapeshotValue["numberDom"] as? String
        numberPod = snapeshotValue["numberPod"] as? String
        numberEtaga = snapeshotValue["numberEtaga"] as? String
        numberKvartiry = snapeshotValue["numberKvartiry"] as? String
        lift = snapeshotValue["lift"] as? Bool
        podyem = snapeshotValue["podyem"] as? Bool
        detailText = snapeshotValue["detailText"] as? String
        
        ref = snapeshot.ref
    }
}
