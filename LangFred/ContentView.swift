//
//  ContentView.swift
//  LangFred
//
//  Created by Chongbin Yao on 10/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var textInput: String = ""
    @State private var showChat: Bool = false
    @State private var messages: [Message] = []

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            // Chat window - only show if showChat is true
            if showChat {
                ChatView(messages: messages)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
            }

            // Text input field
            InputView(text: $textInput, onSubmit: handleSubmit)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .background(.ultraThinMaterial)
        .animation(.easeInOut(duration: 0.3), value: showChat)
        .onAppear {
            // Configure window for glass effect
            if let window = NSApplication.shared.windows.first {
                window.isOpaque = false
                window.backgroundColor = .clear
            }
        }
    }

    private func handleSubmit() {
        guard !textInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }

        // Add the user message to the array
        messages.append(Message(text: textInput, isFromUser: true))

        // Generate a random number from 1-10 and add app's reply
        let randomNumber = Int.random(in: 1...10)
        messages.append(Message(text: "\(randomNumber)", isFromUser: false))

        // Show the chat window
        showChat = true

        // Clear the text input
        textInput = ""
    }
}

#Preview {
    ContentView()
}
