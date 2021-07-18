//
//  UserModel.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation

struct UserModel: Codable {
    let id: ID
    var name: String
    
    init(id: UserModel.ID, name: String) {
        self.id = id
        self.name = name
    }
    
    struct ID: Hashable, ExpressibleByStringLiteral, Codable {
        let value: String
        
        init(_ value: String) {
            self.value = value
        }
        
        init(stringLiteral value: StringLiteralType) {
            self.init(value)
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            self.init(value)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(value)
        }
    }
}
