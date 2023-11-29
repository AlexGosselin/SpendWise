//
//  TaxCalculatorResult.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-21.
//

import SwiftUI

struct TaxCalculatorResult: View {
    @EnvironmentObject var taxCalculatorModel: TaxCalculatorViewModel
    
    var body: some View {
        Text("Net income")
            .font(.subheadline)
            .fontWeight(.bold)
        
        Text("\(taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.netIncome)))")
            .font(.title)
            .fontWeight(.bold)
        
        VStack{
            Divider()
            TaxResultRows(desc: "Gross income", amount: taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.grossIncomeValue)))
            Divider()
            TaxResultRows(desc: "Federal tax", amount: taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.federalTax)))
            Divider()
            TaxResultRows(desc: "Provincial tax", amount: taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.provinceTax)))
            Divider()
            TaxResultRows(desc: "CPP deduction", amount: taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.cppDeduction)))
            Divider()
            TaxResultRows(desc: "EI deduction", amount: taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.eiDeduction)))
            Divider()
            TaxResultRows(desc: "Total tax deduction", amount: taxCalculatorModel.formatNumber(isNumber: Double(taxCalculatorModel.totalTax)))
            Divider()
        }
        .padding(.horizontal, 50)
        .padding()
    }
}

#Preview {
    TaxCalculatorResult()
}

struct TaxResultRows: View {
    let desc: String
    let amount: String
    
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(desc)
                .foregroundStyle(.secondary)
            Spacer()
            Text("$\(amount)")
                .fontWeight(.semibold)
                .foregroundStyle(desc == "Total tax deduction" ? .red : .primary )
            Spacer()
        }
    }
}
