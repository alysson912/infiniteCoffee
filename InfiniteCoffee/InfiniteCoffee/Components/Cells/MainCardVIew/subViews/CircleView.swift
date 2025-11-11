//
//  HeartView.swift
//  InfiniteCoffee
//
//  Created by Alysson Menezes Dodo on 07/11/25.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.marron)
                .frame(width: 40 ,height: 40)
            
            Image(systemName: "circle.fill")
                .foregroundStyle(.highGrey)
                .font(.system(size: 15))
                
            
            
            
        }
        .shadow(color: Color.black.opacity(0.3), radius: 5)

    }
}

#Preview {
    CircleView()
}
