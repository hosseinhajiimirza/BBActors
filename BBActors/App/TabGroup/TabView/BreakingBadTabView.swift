//
//  BreakingBadTabView.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct BreakingBadTabView: View {
    init() {
        
    }
    var body: some View {
        TabView {
            Characters()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
            Quotes()
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Quotes")
                }
            Episodes()
                .tabItem {
                    Image(systemName: "film")
                    Text("Episodes")
                }
        }
        .accentColor(.cyan)
    }
}

struct BreakingBadTabView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadTabView()
    }
}
