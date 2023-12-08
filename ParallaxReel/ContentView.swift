//
//  ContentView.swift
//  ParallaxReel
//
//  Created by Alise Serhiienko on 07.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.systemBackground
                .ignoresSafeArea()
            
                VStack(alignment: .leading) {
                    
                    Text("Welcome to")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 24)
                    
                    Text("Guitar Hub")
                        .font(.system(size: 32, weight: .medium))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Parallax Carousel
                    GeometryReader { geometry in
                        let size = geometry.size
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 6) {
                                ForEach(guitarCards) { card in
                                    
                                    GeometryReader { proxy  in
                                        let cardSize = proxy.size
                                        let minX = min((proxy.frame(in: .scrollView).minX * 0.8), proxy.size.width * 0.8)
                                        
                                        Image(card.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .scaleEffect(1.24)
                                            .offset(x: -minX)
                                            .frame(width: cardSize.width, height: cardSize.height)
                                            .clipShape(.rect(cornerRadius: 16))
                                    }
                                    .frame(width: size.width - 58, height: size.height - 46)
                                    //Scroll Animation
                                    .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                        view
                                            .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                            .scrollTargetLayout()
                            .frame(height: size.height, alignment: .top)
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                    }
                    .frame(height: 500)
                    .padding(.horizontal, -16)
                    .padding(.top, 10)

                }
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    ContentView()
}
