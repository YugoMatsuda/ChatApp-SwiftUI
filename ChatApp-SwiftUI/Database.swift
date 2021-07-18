//
//  Database.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

enum Database: DatabaseProtocol {

    static func messagges() -> AnyPublisher<[MessageModel], Error> {
        let sublect: PassthroughSubject<[MessageModel], Error> = .init()
        let db =  Firestore.firestore()
        let listner = db.collection("messages")
            .order(by: "date")
            .addSnapshotListener { querySnapShot, error in
            guard let querySnapShot = querySnapShot else {
                sublect.send(completion: .failure(error!))
                return
            }
            do {
                let messages: [MessageModel] = try querySnapShot.documents.compactMap { try $0.data(as: MessageModel.self) }
                sublect.send(messages)
            } catch {
                sublect.send(completion: .failure(error))
            }
        }
        return sublect.handleEvents(receiveCancel: { listner.remove()}).eraseToAnyPublisher()
    }
    
    static func postMessage(_ message: MessageModel, completion: @escaping (Result<Void,Error>) -> Void) {
        let db =  Firestore.firestore()
        do {
            _ = try db.collection("messages").addDocument(from: message) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
    
}
