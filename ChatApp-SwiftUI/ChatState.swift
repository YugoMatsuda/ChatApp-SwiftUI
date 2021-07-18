//
//  ChatState.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
// VMに相当する

import Combine
import Foundation

final class ChatState: ObservableObject {
    // 1:08:55 説明　PublishedをつけるとObserverになり変更されたことを検知してObservableObjectの変更として検知できる
    @Published var messages: [MessageModel] = []
    
    func postMessage(_ message: MessageModel, completion: @escaping (Result<Void,Error>) -> Void) {
        Database.postMessage(message, completion: completion)
    }
}

struct DummyError: Error { }
