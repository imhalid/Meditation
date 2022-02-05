//
//  MedidationView.swift
//  Meditation
//
//  Created by Halid İçli on 2.02.2022.
//

import SwiftUI

struct MedidationView: View {
     @StateObject var meditationVM: MeditationViewModel
     @State private var showPlayer = false
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
            .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                
                Color(hue: 0.631, saturation: 0.024, brightness: 0.782)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.5), radius: 20, x: -3, y: 0)
                    
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Music")
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "S")
                    }.foregroundColor(.black)
                        .textCase(.uppercase)
                        .opacity(0.7)
                    
                    Text(meditationVM.meditation.title)
                        .font(.title)
                    
                    Button {
                        showPlayer.toggle()
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                        
                    }
                    ScrollView {
                        Text(meditationVM.meditation.description)
                    }
                    .frame(maxWidth: .infinity)
//                        .background(.blue)
                        
                    
                    
                    Spacer()
                }
                .padding(20)
            }.frame(height: UIScreen.main.bounds.height * 2 / 3)
        }.ignoresSafeArea()
            .fullScreenCover(isPresented: $showPlayer) {
                PlayerView(meditationVM: meditationVM)
            }
    }
}


struct MedidationView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        MedidationView(meditationVM: meditationVM)
    }
}
