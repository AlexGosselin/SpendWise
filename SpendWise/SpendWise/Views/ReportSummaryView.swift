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
        HStack {
            VStack {
                Text("Incoming")
                    .font(.headline)
                Text(String(incoming.formatted(.currency(code: "USD")) ))
                    .font(.title2)
                    .foregroundStyle(.green)

            }
            
            Spacer()
            
            VStack {
                Text("Outgoing")
                    .font(.headline)
                Text(String(((outgoing ) * -1).formatted(.currency(code: "USD")) ))
                    .font(.title2)
                    .foregroundStyle(.red)

            }
            
            Spacer()

            VStack {
                Text("Net")
                    .font(.headline)
                Text(String((incoming - outgoing).formatted(.currency(code: "USD")) ))
                    .font(.title2)

            }
        }
        .padding()
    }
}

//#Preview {
//    ReportSummaryView()
//}
