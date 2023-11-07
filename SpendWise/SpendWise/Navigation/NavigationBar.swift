//
//  NavigationBar.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @State var showSheet = false
    @Binding var contentHasScrolled: Bool
    
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
                .frame(maxHeight: .infinity, alignment: .top)
                .blur(radius: contentHasScrolled ? 10 : 0)
                .opacity(contentHasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: contentHasScrolled ? 22 : 34, weight: .bold)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .opacity(contentHasScrolled ? 0.7 : 1)
            
            HStack(spacing: 16) {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial)
                        .cornerRadius(18)
                }
                .sheet(isPresented: $showSheet) {
                    // MARK: Incase anyone wants to explore and do anything here
                }
                
                Button {
                } label: {
                    avatar
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .offset(y: contentHasScrolled ? -16 : 0)
    }
    
    @ViewBuilder
    var avatar: some View {
            AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeOut)) { phase in
                switch phase {
                case .empty:
                    Color.white
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Color.gray
                @unknown default:
                    Color.gray
                }
            }
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(18)
            .transition(.scale.combined(with: .slide))
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(contentHasScrolled: .constant(false))
            .environmentObject(AppModel())
    }
}

