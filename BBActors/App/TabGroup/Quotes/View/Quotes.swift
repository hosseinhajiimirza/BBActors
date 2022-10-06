//
//  Quotes.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct Quotes: View {
    @StateObject private var quoteViewModel: QuotesViewModel = .init()
    @State private var navTitle = "Loading..."
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    Task {
                        quoteViewModel.fetchData()
                    }
                }
                
                if let quotesModel = quoteViewModel.quotesModel {
                    ZStack {
                        if quotesModel.isEmpty {
                            Text("Empty!")
                        } else {
                            VStack {
                                ForEach(quotesModel) { quoteModel in
                                    QuoteRow(quoteModel: quoteModel)
                                }
                            }
                        }
                    }
                    .onAppear {
                        navTitle = "Quotes"
                    }
                }
            }
            .coordinateSpace(name: "pullToRefresh")
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            quoteViewModel.fetchData()
        }
    }
}

struct Quotes_Previews: PreviewProvider {
    static var previews: some View {
        Quotes()
//            .preferredColorScheme(.dark)
    }
}
