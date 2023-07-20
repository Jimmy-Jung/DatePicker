//
//  DateStorage.swift
//  DatePicker
//
//  Created by 정준영 on 2023/07/20.
//

import Foundation

struct DatePicked {
    var title: String
    var date: Date
}

class DateStorage {
    static let shared = DateStorage()
    private init() {}
    
    var dateCollection: [DatePicked] = []
}
