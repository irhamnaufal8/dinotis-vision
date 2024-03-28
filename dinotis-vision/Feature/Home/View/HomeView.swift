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
                LazyVStack(alignment: .leading, spacing: 16, pinnedViews: .sectionHeaders) {
                    bannerView
                    mainContent
                }
                .blur(radius: viewModel.isShowSessionDetail ? 10 : 0)
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
                    .popover(isPresented: $viewModel.isShowSessionDetail, arrowEdge: .leading) {
                        detailSession
                    }
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
        Section {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200), spacing: 16)], spacing: 16, content: {
                ForEach(viewModel.sessions) { session in
                    Button {
                        viewModel.seeDetailSession(session)
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
                                            Label("Gratis", systemImage: "ticket")
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
            .animation(.bouncy, value: viewModel.currentSection)
            .padding(.horizontal, 28)
            .padding(.vertical)
        } header: {
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
            .padding(.vertical)
            .padding(.horizontal, 28)
        }
        
    }
    
    @ViewBuilder
    var detailSession: some View {
        if let session = viewModel.currentSession {
            ScrollView {
                VStack(spacing: 24) {
                    session.poster
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(session.title)
                            .font(.largeTitle)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                session.creator.avatar
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(.circle)
                                
                                Text(session.creator.name)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Divider()
                    
                    Text(session.description)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    Color.clear
                        .frame(height: 160)
                }
            }
            .overlay(alignment: .bottom) {
                VStack(spacing: 0) {
                    Label(session.price == 0 ? "Gratis" : session.price.toRupiah, systemImage: "cart")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(16, corners: [.topLeft, .topRight])
                    
                    Button {
                        
                    } label: {
                        Text("Book")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.Dinotis.primary.gradient)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                    .buttonBorderShape(.roundedRectangle(radius: 12))
                    .padding()
                    .background(.regularMaterial)
                }
            }
            .frame(width: 500, height: 700)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
