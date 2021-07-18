//
//  MessageModel.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation

struct MessageModel: Identifiable, Codable {
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
    
    struct ID: Hashable, Codable {
        let value: UUID
        init(_ value: UUID) {
            self.value = value
        }
        
        init() {
            self.init(UUID())
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(UUID.self)
            self.init(value)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(value)
        }
    }
}
