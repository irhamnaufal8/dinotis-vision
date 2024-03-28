//
//  HomeViewModel.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 27/03/24.
//

import SwiftUI

enum EventType: CaseIterable {
    case newest
    case comingSoon
    
    var name: String {
        switch self {
        case .newest:
            "Terbaru"
        case .comingSoon:
            "Akan Datang"
        }
    }
}

@Observable
final class HomeViewModel {
    let banners = Banner.homeBanner
    var currentSection: EventType = .newest
    
    var sessions: [Session] {
        switch currentSection {
        case .newest:
            Session.sample
        case .comingSoon:
            Session.sample2
        }
    }
    var currentSession: Session?
    
    var isShowSessionDetail = false
    
    func seeDetailSession(_ session: Session) {
        currentSession = session
        isShowSessionDetail = true
    }
}
