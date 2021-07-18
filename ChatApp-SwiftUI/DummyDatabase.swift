//
//  DummyDatabase.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation
import Combine

enum DummyDatabase: DatabaseProtocol {
    // 1:24:35 BehaviourRelay
    private static let messageSublect: CurrentValueSubject<[MessageModel], Error> = .init([])

    static func messagges() -> AnyPublisher<[MessageModel], Error> {
        return messageSublect.eraseToAnyPublisher()
    }
    
    static func postMessage(_ message: MessageModel, completion: @escaping (Result<Void,Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if Bool.random() {
                messageSublect.value.append(message)
                completion(.success(()))
            } else {
                completion(.failure(DummyError()))
            }
        }
    }
    
}
