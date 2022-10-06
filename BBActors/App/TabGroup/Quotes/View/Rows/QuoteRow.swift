//
//  QuoteRow.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct QuoteRow: View {
    let randomColor = Color.random
    
    let quoteModel: QuoteModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(quoteModel.author)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(quoteModel.quote)
                    .font(.body)
            }
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
        .background(
            ZStack {
                Color.white
                LinearGradient(colors: [randomColor.opacity(0.3) ,randomColor.opacity(0.5), randomColor.opacity(0.7)], startPoint: .bottomLeading, endPoint: .trailing)
            }
        )
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct QuoteRow_Previews: PreviewProvider {
    static var previews: some View {
        QuoteRow(quoteModel: QuoteModel())
//            .preferredColorScheme(.dark)
    }
}
