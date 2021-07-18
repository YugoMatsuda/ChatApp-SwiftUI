//
//  ChatView.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import SwiftUI

struct ChatView: View {
    let messages: [MessageModel]
    //Stateの値が変更されるとbodyが再実行される　51ふん50秒　single source truth
    @State private var messageText = ""
    let hasWriteError: Bool
    @Namespace private var bottomId
    
    let postMessage: (MessageModel, @escaping (Result<Void, Error>) -> Void) -> Void
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(messages) { message in
                            MessageView(message: message)
                                .padding()
                            Divider()
                        }
                        Divider()
                            .id(bottomId)
                    }
                }
                Divider()
                VStack(alignment: .leading) {
                    if hasWriteError {
                        Text("投稿に失敗しました")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                            .padding()
                    }
                

                    HStack {
                        TextField("", text: $messageText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button(action: {
                            let message = MessageModel(user: PreviewValues.user, text: messageText, date: Date())
                            postMessage(message) { result in
                                do {
                                    try                             result.get()
                                    DispatchQueue.main.async {
                                        proxy.scrollTo(bottomId)
                                    }
                                } catch {
                                    messageText = message.text
                                }
                            }
                            messageText = ""
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                }
            }
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(messages: PreviewValues.messages, hasWriteError: true) {_, _ in}
    }
}
