//
//  MeditationViewModel.swift
//  Meditation
//
//  Created by Halid İçli on 3.02.2022.
//

import Foundation
final class MeditationViewModel: ObservableObject {
    @Published var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}
struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
   static let data = Meditation(title: "deneme", description: "deneme", duration: 70, track: "deneme", image: "cloud")
}
