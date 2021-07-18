//
//  MessageModel.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation

struct MessageModel {
    var name: String
    var text: String
    var date: Date
    
    init(name: String, text: String, date: Date) {
        self.name = name
        self.text = text
        self.date = date
    }
}
