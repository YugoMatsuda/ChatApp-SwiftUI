//
//  PreviewValues.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation

enum PreviewValues {
    static let user: UserModel = UserModel(id: "abc", name: "Ugo")
    static let message: MessageModel = .init(user: user, text: "アイウエオ", date: Date())
    static let messages: [MessageModel] = [
        .init(user: UserModel(id: "abc", name: "Ugo"), text: "アイウエオ", date: Date()),
        .init(user: UserModel(id: "def", name: "Matsuda"), text: "kakakakak", date: Date()),
        .init(user: UserModel(id: "qqkpk", name: "Yaamada"), text: "Yamamaigi", date: Date()),
        .init(user: UserModel(id: "abc", name: "Ugo"), text: "アイウエオ", date: Date()),
        .init(user: UserModel(id: "def", name: "Matsuda"), text: "kakakakak", date: Date()),
        .init(user: UserModel(id: "qqkpk", name: "Yaamada"), text: "Yamamaigi", date: Date()),
        .init(user: UserModel(id: "abc", name: "Ugo"), text: "アイウエオ", date: Date()),
        .init(user: UserModel(id: "def", name: "Matsuda"), text: "kakakakak", date: Date()),
        .init(user: UserModel(id: "qqkpk", name: "Yaamada"), text: "Yamamaigi", date: Date()),
        .init(user: UserModel(id: "abc", name: "Ugo"), text: "アイウエオ", date: Date()),
        .init(user: UserModel(id: "def", name: "Matsuda"), text: "kakakakak", date: Date()),
        .init(user: UserModel(id: "qqkpk", name: "Yaamada"), text: "Yamamaigi", date: Date()),
        .init(user: UserModel(id: "abc", name: "Ugo"), text: "アイウエオ", date: Date()),
        .init(user: UserModel(id: "def", name: "Matsuda"), text: "kakakakak", date: Date()),
        .init(user: UserModel(id: "qqkpk", name: "Yaamada"), text: "Yamamaigi", date: Date()),
    ]

}
