//
//  UserModel.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation

struct UserModel {
    let id: ID
    var name: String
    
    init(id: UserModel.ID, name: String) {
        self.id = id
        self.name = name
    }
    
    struct ID: Hashable, ExpressibleByStringLiteral {
        let value: String
        
        init(_ value: String) {
            self.value = value
        }
        
        init(stringLiteral value: StringLiteralType) {
            self.init(value)
        }
    }
}
