//
//  ContentView.swift
//  EmojiLover
//
//  Created by Ashparsh Pandey on 31/10/24.
//

import SwiftUI

enum Emoji: String, CaseIterable {
    case eyes = "👀"
    case ok = "👌"
    case clap = "👏"
    case peace = "✌️"
}

struct ContentView: View {
    @State private var selection: Emoji = .eyes

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Spacer()

                // Display the selected emoji with enhanced styling
                Text(selection.rawValue)
                    .font(.system(size: 180))
                    .padding()
                    .background(
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.mint, Color.purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 250, height: 250)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)

                // Segmented Picker with larger text and padding
                Picker("", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                            .font(.title)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Emoji Lover ❤️")
            .navigationBarTitleDisplayMode(.inline)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.purple.opacity(0.9)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    ContentView()
}
