//
//  Database.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import FirebaseFirestore
import Combine

enum Database: DatabaseProtocol {

    static func messagges() -> AnyPublisher<[MessageModel], Error> {
        fatalError()
    }
    
    static func postMessage(_ message: MessageModel, completion: @escaping (Result<Void,Error>) -> Void) {
        let db =  Firestore.firestore()
        
    }
    
}
