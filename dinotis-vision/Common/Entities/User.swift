//
//  User.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 28/03/24.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name: String
    var avatar: Image
}

extension User {
    static let sample1 = User(name: "Blue Building Corp.", avatar: .logoCompany1)
    static let sample2 = User(name: "Stock Shield", avatar: .logoCompany2)
    static let sample3 = User(name: "Mountain of Blue", avatar: .logoCompany3)
    static let sample4 = User(name: "Masterio Inc.", avatar: .logoCompany4)
    static let sample5 = User(name: "Red Corp.", avatar: .logoCompany5)
}
