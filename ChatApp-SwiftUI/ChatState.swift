//
//  ChatState.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
// VMに相当する

import Combine
import Foundation

final class ChatState<Database: DatabaseProtocol>: ObservableObject {
    // 1:08:55 説明　PublishedをつけるとObserverになり変更されたことを検知してObservableObjectの変更として検知できる
    @Published var messages: [MessageModel] = []
    private var isActive = false
    
    // Disaposebag相当
    private var cancellables: Set<AnyCancellable> = []
    
    func activate() {
        if isActive { return }
        isActive = true
        Database.messagges().sink { _ in
            // Todo
        } receiveValue: { [weak self] messages in
            guard let self = self else { return }
            self.messages = messages
        }.store(in: &cancellables)
    }
    
    func deActivate() {
        guard isActive else { return }
        cancellables.removeAll()
    }
    
    func postMessage(_ message: MessageModel, completion: @escaping (Result<Void,Error>) -> Void) {
        Database.postMessage(message, completion: completion)
    }
}

struct DummyError: Error { }
