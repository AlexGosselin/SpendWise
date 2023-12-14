//
//  ReportSummaryView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-28.
//

import SwiftUI

struct ReportSummaryView: View {
    
    @Binding var outgoing: Double
    @Binding var incoming: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("Incoming: ")
                    .font(.headline)
                Text(String(incoming.formatted(.currency(code: "USD")) ))
                    .font(.title2)
                    .foregroundStyle(.green)

            }
            
//            Spacer()
            
            HStack {
                Text("Outgoing: ")
                    .font(.headline)
                Text(String(((outgoing ) * -1).formatted(.currency(code: "USD")) ))
                    .font(.title2)
                    .foregroundStyle(.red)

            }
            
//            Spacer()

            HStack {
                Text("Net: ")
                    .font(.headline)
                Text(String((incoming - outgoing).formatted(.currency(code: "USD")) ))
                    .font(.title2)
                    .foregroundStyle((incoming < outgoing) ? .red : .green)


            }
        }
        .padding()
    }
}

//#Preview {
//    ReportSummaryView()
//}
