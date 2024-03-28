//
//  HomeView.swift
//  dinotis-vision
//
//  Created by Irham Naufal on 27/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @Bindable var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    bannerView
                    mainContent
                }
            }
            .toolbar { toolbar }
        }
    }
}

extension HomeView {
    var toolbar: some ToolbarContent {
        Group {
            ToolbarItem(placement: .topBarLeading) {
                Image.logoFullWhite
                    .blendMode(.screen)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.badge.fill")
                            .foregroundStyle(.red, .white)
                    }
                    .buttonBorderShape(.circle)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "questionmark.bubble.fill")
                    }
                    .buttonBorderShape(.circle)
                }
            }
            
            
        }
    }
    
    @ViewBuilder
    var bannerView: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(viewModel.banners) { banner in
                    banner.image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.8)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 28)
        .frame(height: 340)
    }
    
    @ViewBuilder
    var mainContent: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Semua Event")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Picker("", selection: $viewModel.currentSection) {
                    ForEach(EventType.allCases, id: \.name) { type in
                        Text(type.name)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200), spacing: 16)], spacing: 16, content: {
                ForEach(viewModel.sessions) { session in
                    Button {
                        
                    } label: {
                        session.poster
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 200)
                            .frame(height: 300)
                            .overlay(alignment: .bottomLeading) {
                                VStack(alignment: .leading) {
                                    Text(session.title)
                                        .lineLimit(2)
                                    
                                    HStack {
                                        session.creator.avatar
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 24, height: 24)
                                            .clipShape(Circle())
                                        
                                        Text(session.creator.name)
                                            .font(.caption)
                                            .lineLimit(1)
                                    }
                                    
                                    Group {
                                        if session.price == 0 {
                                            Label("Free", systemImage: "ticket")
                                                .font(.caption)
                                                .padding(4)
                                                .padding(.horizontal, 4)
                                                .background(.thinMaterial)
                                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                        } else {
                                            Text(session.price.toRupiah)
                                                .font(.headline)
                                        }
                                    }
                                    .padding(.top, 8)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.thickMaterial)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                    .buttonBorderShape(.roundedRectangle(radius: 12))
                }
            })
        }
        .padding(.horizontal, 28)
        .padding(.vertical)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
