//
//  ColorSetings.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 30/03/2019.
//  Copyright © 2019 Артем Валерьевич. All rights reserved.
//

import Foundation
import UIKit

class ColorSetings {
    public init() {}
    
    static func colorCell(indexColor: Int, cell: TableViewCell, arrayColor: [UIColor])  {
        
        switch indexColor {
        case 0:
            cell.viewCell.backgroundColor = arrayColor[0]
            cell.weekday.textColor = UIColor.white
            cell.adress.textColor = UIColor.white
            cell.numberZakaza.textColor = UIColor.white
            cell.sumPodyema.textColor = UIColor.white
            cell.date.textColor = UIColor.lightGray
            cell.viewSeparator.backgroundColor = UIColor.white
        case 1:
            cell.viewCell.backgroundColor = arrayColor[1]
            cell.weekday.textColor = UIColor.black
            cell.adress.textColor = UIColor.black
            cell.numberZakaza.textColor = UIColor.black
            cell.sumPodyema.textColor = UIColor.black
            cell.date.textColor = UIColor.darkGray
            
            cell.viewSeparator.backgroundColor = UIColor.black
        case 2:
            cell.viewCell.backgroundColor = arrayColor[2]
            cell.weekday.textColor = UIColor.white
            cell.adress.textColor = UIColor.white
            cell.numberZakaza.textColor = UIColor.white
            cell.sumPodyema.textColor = UIColor.white
            cell.date.textColor = UIColor.lightGray
            cell.viewSeparator.backgroundColor = UIColor.white
        case 3:
            cell.viewCell.backgroundColor = arrayColor[3]
            cell.weekday.textColor = UIColor.white
            cell.adress.textColor = UIColor.white
            cell.numberZakaza.textColor = UIColor.white
            cell.sumPodyema.textColor = UIColor.white
            cell.date.textColor = UIColor.lightGray
            cell.viewSeparator.backgroundColor = UIColor.white
        case 4:
            cell.viewCell.backgroundColor = arrayColor[4]
            cell.weekday.textColor = UIColor.white
            cell.adress.textColor = UIColor.white
            cell.numberZakaza.textColor = UIColor.white
            cell.sumPodyema.textColor = UIColor.white
            cell.date.textColor = UIColor.lightGray
            cell.viewSeparator.backgroundColor = UIColor.white
        case 5:
            cell.viewCell.backgroundColor = arrayColor[5]
            cell.weekday.textColor = UIColor.white
            cell.adress.textColor = UIColor.white
            cell.numberZakaza.textColor = UIColor.white
            cell.sumPodyema.textColor = UIColor.white
            cell.date.textColor = UIColor.lightGray
            cell.viewSeparator.backgroundColor = UIColor.white
        case 6:
            cell.viewCell.backgroundColor = arrayColor[6]
            cell.weekday.textColor = UIColor.black
            cell.adress.textColor = UIColor.black
            cell.numberZakaza.textColor = UIColor.black
            cell.sumPodyema.textColor = UIColor.black
            cell.date.textColor = UIColor.darkGray
            cell.viewSeparator.backgroundColor = UIColor.black
        case 7:
            cell.viewCell.backgroundColor = arrayColor[7]
            cell.weekday.textColor = UIColor.black
            cell.adress.textColor = UIColor.black
            cell.numberZakaza.textColor = UIColor.black
            cell.sumPodyema.textColor = UIColor.black
            cell.date.textColor = UIColor.darkGray
            cell.viewSeparator.backgroundColor = UIColor.black
        case 8:
            cell.viewCell.backgroundColor = arrayColor[8]
            cell.weekday.textColor = UIColor.black
            cell.adress.textColor = UIColor.black
            cell.numberZakaza.textColor = UIColor.black
            cell.sumPodyema.textColor = UIColor.black
            cell.date.textColor = UIColor.darkGray
            cell.viewSeparator.backgroundColor = UIColor.black
        case 9:
            cell.viewCell.backgroundColor = arrayColor[9]
            cell.weekday.textColor = UIColor.black
            cell.adress.textColor = UIColor.black
            cell.numberZakaza.textColor = UIColor.black
            cell.sumPodyema.textColor = UIColor.black
            cell.date.textColor = UIColor.darkGray
            cell.viewSeparator.backgroundColor = UIColor.black
        default:
            break
        }
    }
    
    
    static func colorsVC(indexColor: Int, arrayTitleView: [UILabel], arraySeparators: [UIView]!, viewDetail: UIView,completion: @escaping(UIColor, [UIView], [UILabel]) -> Void)  {
        var borderColor: UIColor!
        let titleView = arrayTitleView
        let seprators = arraySeparators
        switch indexColor {
        case 0:
            borderColor = UIColor.white
            for i in titleView {
                i.textColor = UIColor.white
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.white
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 1:
            borderColor = UIColor.black
            for i in titleView {
                i.textColor = UIColor.black
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.black
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 2:
            borderColor = UIColor.white
            for i in titleView {
                i.textColor = UIColor.white
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.white
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 3:
            borderColor = UIColor.white
            for i in titleView {
                i.textColor = UIColor.white
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.white
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 4:
            borderColor = UIColor.white
            for i in titleView {
                i.textColor = UIColor.white
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.white
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 5:
            borderColor = UIColor.white
            for i in titleView {
                i.textColor = UIColor.white
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.white
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 6:
            borderColor = UIColor.black
            for i in titleView {
                i.textColor = UIColor.black
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.black
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 7:
            borderColor = UIColor.black
            for i in titleView {
                i.textColor = UIColor.black
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.black
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 8:
            borderColor = UIColor.black
            for i in titleView {
                i.textColor = UIColor.black
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.black
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        case 9:
            
            borderColor = UIColor.black
            for i in titleView {
                i.textColor = UIColor.black
                
            }
            for i in seprators! {
                i.backgroundColor = UIColor.black
            }
            viewDetail.layer.borderColor = borderColor.cgColor
        default:
            break
        }
        completion(borderColor, arraySeparators, arrayTitleView)
    }
}
