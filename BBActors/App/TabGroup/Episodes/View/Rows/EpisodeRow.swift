//
//  EpisodeRow.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct EpisodeRow: View {
    @State private var showAnswer: Bool = false
    
    var episodeModel: EpisodeModel
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                withAnimation(.ripple(index: 1)) {
                    showAnswer.toggle()
                }
            } label: {
                HStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        Text(episodeModel.title)
                            .font(.body)
                            .fontWeight(.medium)
                        Text("S\(episodeModel.season)E\(episodeModel.episode)")
                            .font(.callout)
                    }
                    .foregroundColor((colorScheme == .light) ? Color.black : Color.white)
                    .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.small)
                        .rotationEffect(Angle(degrees: showAnswer ? 90 : 0))
                        .foregroundColor(.cyan)
                }
                .padding(.horizontal)
            }
            
            if showAnswer {
                HStack(alignment: .center) {
                    Text("Characters:")
                        .font(.footnote)
                    ScrollView(.horizontal ,showsIndicators: false) {
                        HStack(alignment: .center) {
                            ForEach(episodeModel.characters, id: \.self) { character in
                                Text(character)
                                    .font(.caption)
                                    .padding(8)
                                    .background(.secondary.opacity(0.1))
                                    .clipShape(Capsule())
                                    .padding(.trailing, character == episodeModel.characters.last ? 16 : 0)
                            }
                        }
                    }
                    .foregroundColor(.secondary)
                }
                .padding(.bottom, 8)
                .padding(.leading)
            }
        }
        .padding(.vertical, 12)
        .background(.cyan.opacity(colorScheme == .light ? 0.1 : 0.2))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct EpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRow(episodeModel: EpisodeModel())
            .preferredColorScheme(.dark)
    }
}
