//
//  RatingPillView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 11/11/25.
//

import SwiftUI

struct RatingPillView: View {
    var coffe: CoffeModel
    var rating: Double = 4.3

    var body: some View {
        HStack (spacing: 4) {
          Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            
            Text(String(coffe.rating ?? 0.0))
                .foregroundStyle(.darkGrey)
        }
       
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        
        .background(Color.highGrey)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: Color.black.opacity(0.3), radius: 5)
    }
}



#Preview {
    VStack {
        RatingPillView(coffe: MockData.sampleAppetizer)
    }
    .padding()
}
