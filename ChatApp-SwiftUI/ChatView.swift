//
//  ChatView.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(1 ... 10, id: \.self) { _ in
                    MessageView()
                        .padding()
                    Divider()
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
