//
//  PlayerView.swift
//  Meditation
//
//  Created by Halid İçli on 2.02.2022.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0
    @Environment(\.dismiss) var dismiss
    var meditationVM: MeditationViewModel
    var body: some View {
        ZStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                }
                    Spacer()
                }
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                    Spacer()
                
                VStack(spacing: 5) {
                    Slider(value: $value, in: 0...60)
                        .tint(.white)
                        .padding()
                    
                    HStack {
                        Text("0:00")
                        Spacer()
                        Text("1:00")
                    
                    }
                     .font(.caption)
                     .foregroundColor(.white)
                     .padding(.horizontal)
                }
                
                HStack {
                    PlaybackControlButton(systemName: "repeat") {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "gobackward.10") {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "goforward.10") {
                        
                    }
                    Spacer()
                    PlaybackControlButton(systemName: "stop.fill") {
                        
                    }
                }.padding(.horizontal)
            }
            .padding(20)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationVM: meditationVM)
    }
}
