//
//  PopularPillView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 07/11/25.
//

import SwiftUI

struct PopularPillView: View {
    var text: String = "Popular"
    
    var body: some View {
        HStack (spacing: 0) {
            
            Text(text)
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 2)
        .padding(.horizontal, 4)
        .foregroundStyle(.highGrey)
        .background(.marron)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: Color.black.opacity(0.3), radius: 5)
    }
}

#Preview {
    PopularPillView()
}
