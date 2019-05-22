//
//  LineCapView.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 27/10/2018.
//  Copyright © 2018 Артем Валерьевич. All rights reserved.
//

import UIKit

//@IBDesignable
class LineCapView: UIView {


    override func draw(_ rect: CGRect) {
    
        let startPoint = CGPoint(x: 15, y: 15)
        let drop = UIBezierPath()
        drop.move(to: startPoint)
        drop.addLine(to: CGPoint(x: 15, y: 265))
        drop.addLine(to: CGPoint(x: 265, y: 265))
        let colorLine = UIColor.black
        colorLine.setStroke()
        
        drop.lineWidth = 4.0
        drop.stroke()
        
        let dropGrayOne = UIBezierPath()
        dropGrayOne.move(to: startPoint)
        dropGrayOne.addLine(to: CGPoint(x: 250, y: 15))
        dropGrayOne.lineWidth = 2.0
        dropGrayOne.close()
        let dropGrayColor = UIColor.lightGray
        dropGrayColor.setStroke()
        dropGrayOne.stroke()
        
        
        let dropGrayTwo = UIBezierPath()
        dropGrayTwo.move(to: CGPoint(x: 15, y: 62.5 + 15))
        dropGrayTwo.addLine(to: CGPoint(x: 250, y: 62.5 + 15))
        dropGrayTwo.lineWidth = 2.0
       
        let dropGrayColorTwo = UIColor.lightGray
        dropGrayColorTwo.setStroke()
        dropGrayTwo.stroke()
        
        
        let dropGrayThree = UIBezierPath()
        dropGrayThree.move(to: CGPoint(x: 15, y: 125 + 15))
        dropGrayThree.addLine(to: CGPoint(x: 250, y: 125 + 15))
        dropGrayThree.lineWidth = 2.0
        dropGrayThree.close()
        let dropGrayColorThree = UIColor.lightGray
        dropGrayColorThree.setStroke()
        dropGrayThree.stroke()
       

        
        
        
        

        let dropGrayFive = UIBezierPath()
        dropGrayFive.move(to: CGPoint(x: 15, y: 187.5 + 15))
        dropGrayFive.addLine(to: CGPoint(x: 250, y: 187.5 + 15))
        dropGrayFive.lineWidth = 2.0
        dropGrayFive.close()
        let dropGrayColorFive = UIColor.lightGray
        dropGrayColorFive.setStroke()
        dropGrayFive.stroke()
        
        let statisticDrop = UIBezierPath()
        statisticDrop.move(to: CGPoint(x: 63, y: 263))
        statisticDrop.addLine(to: CGPoint(x: 63, y: 100))
        statisticDrop.lineWidth = 25.0
        let colorStatistic = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        colorStatistic.setStroke()
        statisticDrop.stroke()
        
        
       
    }

}
