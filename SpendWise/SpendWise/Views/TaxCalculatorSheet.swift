//
//  TaxCalculatorSheet.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-20.
//

import SwiftUI

struct TaxCalculatorSheet: View {
    @State private var selectedProvince: Province = Province.ON
    @State private var income = ""
    
    @Binding var isShowTaxCalculator: Bool
    @Binding var isNavigateTaxCalculatorResult: Bool
    
    @State private var animateIncome = false
    
    @EnvironmentObject var taxCalculatorModel: TaxCalculatorViewModel
    
    var body: some View {
        Spacer()
        Text("Tax Calculator")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
        
        HStack {
            Text("Province")
            Spacer()
            Picker("Province", selection: $selectedProvince) {
                    ForEach(Province.allCases) { province in
                        Text(province.rawValue)
                    }
                }
            .pickerStyle(.menu)
            .padding()
        }
        
        HStack {
            Text("Gross Income")
            TextField("Enter gross income", text: $income)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .offset(x: animateIncome ? -1 : 1)
                .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value:animateIncome)
                
            .padding()
        }
        Spacer()
        Button("Calculate"){
            var isNumber = taxCalculatorModel.checkIncome(isNumber: String(income))
            
            if(isNumber){
                isShowTaxCalculator = false
                isNavigateTaxCalculatorResult = true
                
                taxCalculatorModel.grossIncomeValue = Float(income) ?? 0
                taxCalculatorModel.provinceValue = selectedProvince.rawValue
                taxCalculatorModel.calculate(income: Double(income) ?? 0.0)
            }else{
                animateIncome.toggle()
            }
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        
        Spacer()
    }
}

#Preview {
    TaxCalculatorSheet(isShowTaxCalculator: .constant(false), isNavigateTaxCalculatorResult: .constant(false))
}
