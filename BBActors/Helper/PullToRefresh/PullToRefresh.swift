//
//  PullToRefresh.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct PullToRefresh: View {
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    CustomActivityIndicator()
                }
                Spacer()
            }
        }.padding(.top, -50)
    }
}
