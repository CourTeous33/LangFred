//
//  ChatView.swift
//  LangFred
//
//  Created by Chongbin Yao on 10/1/25.
//

import SwiftUI

struct ChatView: View {
    let messages: [Message]

    var body: some View {
        VStack(spacing: 8) {
            Text("Chat Messages")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isFromUser {
                                    Spacer()
                                    // User message - right aligned
                                    Text(message.text)
                                        .padding(8)
                                        .background(Color.blue.opacity(0.1))
                                        .cornerRadius(8)
                                } else {
                                    // App message - left aligned
                                    Text(message.text)
                                        .padding(8)
                                        .background(Color.green.opacity(0.1))
                                        .cornerRadius(8)
                                    Spacer()
                                }
                            }
                            .id(message.id)
                        }
                    }
                    .padding()
                }
                .frame(maxHeight: 200)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(10)
                .onChange(of: messages.count) { _, _ in
                    // Scroll to the last message when a new message is added
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
        }
        .transition(.opacity.combined(with: .move(edge: .top)))
    }
}

#Preview {
    ChatView(messages: [
        Message(text: "Hello!", isFromUser: true),
        Message(text: "5", isFromUser: false),
        Message(text: "Another message", isFromUser: true),
        Message(text: "3", isFromUser: false)
    ])
    .padding()
}
