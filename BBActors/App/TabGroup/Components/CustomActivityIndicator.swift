//
//  CustomActivityIndicator.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct CustomActivityIndicator: View {
    @State private var offset: Double = 0
    @State private var isRotated: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 22, height: 22)
                    .foregroundColor(.secondary.opacity(0.5))
                Circle()
                    .trim(from: (offset - 1), to: (0.3 + offset))
                    .stroke(lineWidth: 2)
                    .frame(width: 22, height: 22)
                    .foregroundColor(.cyan)
                    .rotationEffect(Angle(degrees: isRotated ? (360) : 0))
            }
            Text("BBActors")
                .font(.footnote)
                .foregroundColor(.cyan)
        }
        .onAppear {
            withAnimation(.linear(duration: 1)
                .repeatForever(autoreverses: false)) {
                    isRotated.toggle()
                }
            withAnimation(.linear(duration: 2.5)
                .repeatForever(autoreverses: true)) {
                    if offset == 0.5 {
                        offset -= 1
                    } else {
                        offset += 0.5
                    }
                }
        }
    }
}

struct CustomActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomActivityIndicator()
    }
}
