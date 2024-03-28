//
//  Session.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 28/03/24.
//

import SwiftUI

struct Session: Identifiable {
    var id = UUID()
    var poster: Image
    var title: String
    var creator: User
    var price: Int
}

extension Session {
    static let sample: [Session] = [
        Session(poster: .poster1, title: "Pengenalan SwiftUI untuk Membangun Aplikasi Cross-Platform", creator: .sample1, price: 500000),
        Session(poster: .poster2, title: "Memanfaatkan Combine untuk Reactive Programming di iOS", creator: .sample2, price: 0),
        Session(poster: .poster3, title: "Strategi Optimalisasi Performa Aplikasi iOS", creator: .sample3, price: 750000),
        Session(poster: .poster4, title: "Desain UI/UX untuk Aplikasi Mobile", creator: .sample4, price: 0),
        Session(poster: .poster5, title: "Memahami dasar-dasar ARKit untuk Pengembangan Augmented Reality", creator: .sample5, price: 650000),
        Session(poster: .poster6, title: "Machine Learning dengan Swift: Mulai dari Dasar", creator: .sample1, price: 800000),
        Session(poster: .poster7, title: "Pengembangan Backend menggunakan Swift dan Vapor", creator: .sample2, price: 550000),
        Session(poster: .poster8, title: "Blockchain 101: Memahami Teknologi di Balik Bitcoin dan Cryptocurrency", creator: .sample3, price: 900000),
        Session(poster: .poster9, title: "Trend Cryptocurrency 2024: Apa yang Perlu Diketahui Developer", creator: .sample4, price: 950000),
        Session(poster: .poster10, title: "Komputasi Kuantum untuk Pemula: Sebuah Pendekatan Praktis", creator: .sample5, price: 1000000),
        Session(poster: .poster11, title: "Dasar-Dasar Hacking Etis: Bagaimana Melindungi Aplikasi Anda dari Serangan", creator: .sample1, price: 700000),
        Session(poster: .poster12, title: "Pengembangan Game dengan Unity: Panduan untuk Pemula", creator: .sample2, price: 850000)
    ]
}
