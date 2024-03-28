//
//  Banner.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 28/03/24.
//

import SwiftUI

struct Banner: Identifiable {
    var id = UUID()
    var image: Image
}

extension Banner {
    static let homeBanner: [Banner] = [
        .init(image: .banner3),
        .init(image: .banner2),
        .init(image: .banner1)
    ]
}
