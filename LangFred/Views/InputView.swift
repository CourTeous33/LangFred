//
//  InputView.swift
//  LangFred
//
//  Created by Chongbin Yao on 10/1/25.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let onSubmit: () -> Void

    var body: some View {
        TextField("Enter text here...", text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .padding()
            .frame(width: 300, height: 50)
            .background(Color(NSColor.textBackgroundColor))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .font(.system(size: 22))
            .onSubmit {
                onSubmit()
            }
    }
}

#Preview {
    @Previewable @State var text = ""
    InputView(text: $text) {
        print("Submitted: \(text)")
    }
    .padding()
}
