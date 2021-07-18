//
//  MessageModel.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation

struct MessageModel: Identifiable {
    let id: ID
    var user: UserModel
    var text: String
    var date: Date
    
    init(id: ID = ID(), user: UserModel, text: String, date: Date) {
        self.id = id
        self.user = user
        self.text = text
        self.date = date
    }
    
    struct ID: Hashable {
        let value: UUID
        init(_ value: UUID) {
            self.value = value
        }
        
        init() {
            self.init(UUID())
        }
    }
}
