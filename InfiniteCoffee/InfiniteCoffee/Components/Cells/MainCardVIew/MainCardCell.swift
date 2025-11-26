//
//  CoffeCell.swift
//  InfiniteCoffee
//
//  Created by ALYSSON MENEZES on 24/09/25.
//

import SwiftUI

struct MainCardCell: View {
    var coffe: CoffeModel
    var resizingMode: ContentMode = .fill
    
    @State private var cardFrame: CGRect = .zero
    @State var pupular: Bool = true
   // @Binding var selectItem: Bool
    
    var onSelectedItemPressed: (() -> Void)? = nil
    
    var body: some View {
        
        ScrollView(.vertical) {
            LazyVStack(){
                headerCell
                pillsSection
                aboutSection                    
            }
            .padding(.horizontal, 14)
            .clipShape(RoundedRectangle(cornerRadius: 35))
        }
    }
    
    
    private var headerCell: some View {
        
        VStack {
            AsyncImage(url: URL(string: coffe.images)) { image in
                image
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: resizingMode)
                    .frame(height: 200)
                    .clipped()
                
                
                
            } placeholder: {
                Image("food-placeholder")
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: resizingMode)
                    .frame(height: 90)
            }
            
            
        }
        
        
        
    }
    
    private var pillsSection: some View {
        HStack {
            
            if pupular {
                PopularPillView()
            }
            Spacer()
                        
                RatingPillView(coffe: coffe)
            
        }
        
    }
    
    private var aboutSection: some View {
        VStack(alignment: .leading) {
            HStack (){
                Image(systemName: "cup.and.saucer.fill")
                Text(coffe.title ?? "n/a")
                
                    //.font(.title)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.darkGrey)
                    
            }
            
            HStack {
                Image(systemName: "text.rectangle")
                Text(coffe.description ?? "n/a")
                    .font(.system(size: 13))
                    .font(.caption2)
                
                
            }
            .foregroundStyle(.darkGrey)
            .frame(maxWidth: .infinity, alignment: .leading )
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            
            HStack {
                Text("R$: \(String(coffe.price ?? 0.0))")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.marron)
                Spacer()
             //   CircleView(selectItem: $selectItem)
            }
            
            
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
        
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
                    Text("\(coffe.rating ?? 0)")
                        .foregroundStyle(Color.black)
                }
            }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.gray)
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
            .onTapGesture {
                onSelectedItemPressed?()
            }
    }
    
    
}

#Preview {
    VStack {
        MainCardCell(coffe: MockData.sampleAppetizer)
        //MainCardCell(coffe: MockData.sampleAppetizer, selectItem: .constant(false))        
    }
    .padding()
}
