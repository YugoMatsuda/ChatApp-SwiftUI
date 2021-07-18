//
//  Database.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Foundation
import Combine


protocol DatabaseProtocol {
    static func messagges() -> AnyPublisher<[MessageModel], Error>
    static func postMessage(_ message: MessageModel, completion: @escaping (Result<Void,Error>) -> Void)
}
