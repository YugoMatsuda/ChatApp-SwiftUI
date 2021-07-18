//
//  ChatState.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
// VMに相当する

import Combine

final class ChatState: ObservableObject {
    @Published var messages: [MessageModel] = []
    
    func postMessage(_ message: MessageModel) {
        messages.append(message)
    }
}
