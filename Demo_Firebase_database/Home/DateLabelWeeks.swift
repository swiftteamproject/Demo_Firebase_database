//
//  DateLabelWeeks.swift
//  Demo_Firebase_database
//
//  Created by Артем Валерьевич on 31/03/2019.
//  Copyright © 2019 Артем Валерьевич. All rights reserved.
//

import Foundation
import UIKit

class DateLabelWeeks {
    public init() {}
    
    
    static func dateLabelWeeks() -> [String] {
        var customCalendar = Calendar(identifier: .gregorian)
        customCalendar.firstWeekday = 2
        var startDate = Date()
        var interval = TimeInterval()
        customCalendar.dateInterval(of: .weekOfMonth, start: &startDate, interval: &interval, for: Date())
        let endDate = startDate.addingTimeInterval(interval)
        let start = "\(startDate)"
        let end = "\(endDate)"
        let startText = "\(start.prefix(10))"
        let endText = "\(end.prefix(10))"
        
        return [startText, endText]
    }
}
