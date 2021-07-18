//
//  ChatView.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import SwiftUI

struct ChatView: View {
    let messages: [MessageModel]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(messages) { message in
                    MessageView(message: message)
                        .padding()
                    Divider()
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
