//
//  Expense.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI

struct ExpenseView: View {
    @State var contentHasScrolled = false
    @State var showFilter = true
    @EnvironmentObject var expenseListVM: ExpenseViewModel
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            content
                .background(Image("Blob 1").offset(x: -180, y: 300))
        }
    }
    
    var content: some View {
        ScrollView {
            scrollDetection
            
            VStack {
//                List {
                    // MARK: Transaction Groups
                    ForEach(Array(expenseListVM.groupExpenseByMonth()), id: \.key) { month, expenses in
                        Section {
                            // MARK: Transaction List
                            ForEach(expenses) {expense in
                                ExpenseRow(expense: expense)
                                Divider()
                                    .opacity(1)
                            }
                        } header: {
                            // MARK: Transaction Month
                            Text(month)
                        }
                    }
//                }
//                .listStyle(.plain)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
//            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .padding(.top, 70)
        .padding(.horizontal, 20)
        
        .coordinateSpace(name: "scroll")
        .overlay(NavigationBar(title: "Expense", contentHasScrolled: $contentHasScrolled, showFilter: $showFilter))
    }

    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { offset in
            withAnimation(.easeInOut) {
                if offset < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
        
    }




struct ExpenseView_Previews: PreviewProvider {
    static let expenseListVM: ExpenseViewModel = {
        let expenseListVM = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
        expenseListVM.transactions = expenseListPreviewData
        return expenseListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                ExpenseView()
            }
            NavigationView {
                ExpenseView()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(expenseListVM)
        .environmentObject(AppModel())
    }
}
