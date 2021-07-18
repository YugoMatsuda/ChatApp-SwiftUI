//
//  ChatView.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import SwiftUI

struct ChatView: View {
    @State var messages: [MessageModel]
    //Stateの値が変更されるとbodyが再実行される　51ふん50秒　single source truth
    @State private var messageText = ""
    
    @Namespace private var bottomId
    
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
                HStack {
                    TextField("", text: $messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        let message = MessageModel(user: PreviewValues.user, text: messageText, date: Date())
                        messages.append(message)
                        messageText = ""
                        DispatchQueue.main.async {
                            proxy.scrollTo(bottomId)
                        }
                    }, label: {
                        Image(systemName: "paperplane")
                    })
                }
            }
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(messages: PreviewValues.messages)
    }
}
