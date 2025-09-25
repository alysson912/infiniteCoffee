//
//  CoffeCell.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

struct MainCardCell: View {
    let appetizer: CoffeModel
    
    var body: some View {
        ZStack {
          //  Color.highGrey.ignoresSafeArea()
            VStack (alignment: .leading, spacing: 5){
                ImageLoaderView()
                    .frame(width: .infinity, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(alignment: .topLeading) {
                        mostWantedButton
                        
                    }
                    .overlay (alignment: .topTrailing){
                        pillStars
                    }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.darkGrey)
                    
                    Text(appetizer.description)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.darkGrey)
                    
                    HStack {
                        Text("R$\(appetizer.price, specifier: "%.2f")")
                            .foregroundStyle(.marron)
                            .fontWeight(.semibold)
                        Spacer()
                        circleMark
                    }
                    Spacer()
                }
                //.padding(.leading, -15)
            }
        }
        .padding(.leading, 10)
    }
    
    private var mostWantedButton: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.marron)
            .frame(width: 100, height: 40)
            .padding(15)
            .overlay(
                Text("Popular")
                    .foregroundStyle(.lightGrey)
                    .font(.system(size: 17, weight: .medium))
                
            )
            .onTapGesture {
               // onSuperLikePressed?( )
            }
    }
    
    private var pillStars: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.highGrey)
            .frame(width: 75, height: 40)
            .padding(15)
            .overlay {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.yellow)
                   Text("4.8")
                        .foregroundStyle(Color.black)
                }
            }
    }
    
    private var circleMark: some View {
        Circle()
            .frame(width: 35, height: 35)
            .foregroundStyle(Color.marron)
            .overlay {
                Circle()
                    .frame(width: 13, height: 13)
                    .foregroundStyle(Color.lightGrey)
                    .padding()
            }

    }
}


#Preview {
    MainCardCell(appetizer: MockData.sampleAppetizer)
        .padding()
}
