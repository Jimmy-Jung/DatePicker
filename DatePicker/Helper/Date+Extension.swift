//
//  Date+Extension.swift
//  DatePicker
//
//  Created by 정준영 on 2023/07/20.
//

import Foundation

extension Date {
    static func makeD_Day(date: Date) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: currentDate, to: date)
        let dDay = components.day!
        let dDayString = dDay >= 0 ? "D-\(dDay)" : "D+\(-dDay)"
        return dDayString
    }
    
    static func makeCalendar(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd(E)"
        let value = dateFormatter.string(from: date)
        return value
    }
}
