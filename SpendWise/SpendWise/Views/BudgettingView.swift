//
//  BudgettingView.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI

struct BudgettingView: View {
    var namespace: Namespace.ID
    var isAnimated = true
    
    @State var viewState: CGSize = .zero
    @State var showSection = false
    @State var appear = [false, false, false]
    @State var showStatusBar = true
    
    @State var budget = 3000.00
    @State var budgetString = ""
    
    @EnvironmentObject var model: AppModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    
    
    @FocusState private var institutionFocused: Bool
    @State private var expense: Expense = Expense()
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appear[0] ? 0 : 30))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3))
            .modifier(OutlineModifier(cornerRadius: viewState.width / 3))
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 10)
            .scaleEffect(-viewState.width/500 + 1)
            .background(Color("Shadow").opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .ignoresSafeArea()
            
            Button {
                isAnimated ?
                withAnimation(.closeCard) {
                    model.showBudgetting = false
                }
                : presentationMode.wrappedValue.dismiss()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
//            LogoView(image: course.logo)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                .padding(20)
//                .matchedGeometryEffect(id: "logo\(course.index)", in: namespace)
//                .ignoresSafeArea()
//                .accessibility(hidden: true)
        }
        .zIndex(1)
        .onAppear { 
            fadeIn()
        }
    }
        
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .background(
                Image("budget")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .matchedGeometryEffect(id: "image\(0)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .accessibility(hidden: true)
            )
            .background(
                Image("Background 2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(0)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY > 0 ? scrollY / 10 : 0)
                    .accessibility(hidden: true)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30)
                    .matchedGeometryEffect(id: "mask\(0)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                Image(horizontalSizeClass == .compact ? "Waves 1" : "Waves 2")
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 500 + 1 : 1)
                    .opacity(1)
                    .matchedGeometryEffect(id: "waves0", in: namespace)
                    .accessibility(hidden: true)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hola 👋")
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        .opacity(appear[0] ? 1 : 0)
                        .accessibilityElement(children: .combine)
                    
                    Text("Current Budget: $\(String(format: "%.2f", budget))".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .opacity(appear[1] ? 1 : 0)
                        .accessibilityElement(children: .combine)
                    
                    Text("Good job, you have currently set a budget of $\(String(format: "%.2f", budget)), you can change this by inputing a new budget below.")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .opacity(appear[1] ? 1 : 0)
                        .accessibilityElement(children: .combine)
                    
                    HStack {
                        TextField("e.g. 2000", text: $budgetString)
                            .focused($institutionFocused)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .onChange(of: $budgetString) { _ in
                                budgetString = String(budgetString.prefix(12))
                            }
                        
                    }
                    .opacity(appear[2] ? 1 : 0)
                    .accessibilityElement(children: .combine)
                    
                    
                    HStack {
                        Spacer()
                        Button(action: {
                                // Button action
                            if let b = Double(budgetString) {
                                budget = b
                            }
                            }) {
                                Text("Save")
                                    .foregroundColor(.black)  // Set text color to black
                                    .font(.subheadline)           // Set text to bold
                            }
                            .opacity(appear[2] ? 1 : 0)
                        Spacer()
                    }

                }
                .padding(20)
                .padding(.vertical, 10)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .matchedGeometryEffect(id: "blur0", in: namespace)
                        .opacity(appear[0] ? 0 : 1)
                )
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .cornerRadius(30)
                        .opacity(appear[0] ? 1 : 0)
                )
                .offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: 100)
                .padding(20)
            )
        }
        .frame(height: 500)
    }
    
    func close() {
        withAnimation {
            viewState = .zero
        }
        withAnimation(.closeCard.delay(0.2)) {
            model.showBudgetting = false
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation {
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }
}

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.secondary)
            .padding(8)
            .background(.ultraThinMaterial, in: Circle())
            .cornerRadius(18)
    }
}

struct BudgettingView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        BudgettingView(namespace: namespace)
            .environmentObject(AppModel())
    }
}
