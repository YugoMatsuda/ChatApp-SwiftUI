//
//  ChatStateView.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import SwiftUI

struct ChatStateView: View {
    //ObservableObjectの変更を検知できるのがStateObject　値の場合はState、クラスの場合はStateObject
    @StateObject private var state: ChatState<DummyDatabase> = .init()
    
    var body: some View {
        ChatView(messages: state.messages,postMessage: state.postMessage)
            .onAppear{ state.activate()}
            .onDisappear{ state.deActivate()}
    }
}

struct ChatStateView_Previews: PreviewProvider {
    static var previews: some View {
        ChatStateView()
    }
}