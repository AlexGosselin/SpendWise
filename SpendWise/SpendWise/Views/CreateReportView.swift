//
//  CreateReportView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-27.
//

import SwiftUI

struct CreateReportView: View {
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    var body: some View {
        NavigationStack {
            DatePicker("Start Date", selection: $startDate)
                .padding(.bottom)
            DatePicker("End Date", selection: $endDate)
                .padding(.bottom)
            
            NavigationLink("Generate Report") {
                ReportView()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Generate Report")
    }
        
}

#Preview {
    CreateReportView()
}
