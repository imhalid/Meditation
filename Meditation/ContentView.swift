//
//  ContentView.swift
//  Meditation
//
//  Created by Halid İçli on 2.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MedidationView(meditationVM: MeditationViewModel(meditation: Meditation.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
