//
//  Message.swift
//  LangFred
//
//  Created by Chongbin Yao on 10/1/25.
//

import Foundation

struct Message: Identifiable {
    let id: UUID
    let text: String
    let isFromUser: Bool
    let timestamp: Date

    init(text: String, isFromUser: Bool) {
        self.id = UUID()
        self.text = text
        self.isFromUser = isFromUser
        self.timestamp = Date()
    }
}
