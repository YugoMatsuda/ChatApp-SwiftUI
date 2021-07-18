//
//  MessageView.swift
//  ChatApp-SwiftUI
//
//  Created by Yugo Matsuda on 2021-07-18.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color(UIColor.systemGray5))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Yugo")
                    .font(.headline)
                Text("アイウエオアイウエオアイウエオアイウエオ")
                Text("2021-7-18 12:32")
                    .font(.footnote)

            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
