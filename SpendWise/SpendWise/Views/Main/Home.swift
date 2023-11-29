//
//  Home.swift
//  SpendWise
//
//  Created by ayomide olopha on 05/11/2023.
//

import SwiftUI
import SwiftUICharts
import SwiftUIFontIcon

struct HomeView: View {
    @State var contentHasScrolled = false
    @State var showFilter = false
    @EnvironmentObject var model: AppModel
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
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // MARK: Chart
                        let data = expenseListVM.accumulateTransactions()
                        
                        if !data.isEmpty {
//                            let totalExpenses = data.last?.1 ?? 0
                            let totalExpenses = expenseListVM.getMonthlyExpenses()
                            
                            CardView {
                                VStack(alignment: .leading) {
                                    ChartLabel(totalExpenses.formatted(.currency(code: "CAD")), type: .title, format: "$%.02f")
                                    
                                    LineChart()
                                }
                                .background(Color.systemBackground)
                            }
                            .data(data)
                            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon2.opacity(0.4), Color.icon)))
                            .frame(height: 300)
                        }
                        
                        // MARK: Transaction List
                        RecentTransactionList()
                    }
                    .padding()
                    .padding(.top, 70)
                    .frame(maxWidth: .infinity)
//                    // MARK: Notification Icon
//                    ToolbarItem {
//                        NavigationLink(destination: MenuView()) {
//                            FontIcon.text(.awesome5Solid(code: .plus), fontsize: 24, color: Color.icon)
        }
        .coordinateSpace(name: "scroll")
        .overlay(NavigationBar(title: "Welcome", contentHasScrolled: $contentHasScrolled, showFilter: $showFilter))
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
    
    
    
    
    struct HomeView_Previews: PreviewProvider {
        static let expenseListVM: ExpenseViewModel = {
            let expenseListVM = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
            expenseListVM.transactions = expenseListPreviewData
            return expenseListVM
        }()
        
        static var previews: some View {
            Group {
                HomeView()
                    .preferredColorScheme(.dark)
            }
            .environmentObject(expenseListVM)
            .environmentObject(AppModel())
        }
    }
}

