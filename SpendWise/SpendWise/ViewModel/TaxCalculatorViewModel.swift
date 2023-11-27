//
//  TaxCalculatorModel.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-21.
//

import Foundation
import Observation

final class TaxCalculatorViewModel: ObservableObject{
    
    @Published var grossIncomeValue: Float = Float(0.0)
    @Published var provinceValue: String = ""
    
    @Published var provinceTax: Float = Float(0.0)
    @Published var federalTax: Float = Float(0.0)
    @Published var eiDeduction: Float = Float(0.0)
    @Published var cppDeduction: Float = Float(0.0)
    
    @Published var netIncome: Float = Float(0.0)
    @Published var totalTax: Float = Float(0.0)
    
    private var selectedProvincialBracket: [Double] = []
    private var selectedProvincialRate: [Double] = []
    
    private let federalBrackets = [53359.0, 106717.0, 165430.0, 235675.0]
    private let federalRates = [0.15, 0.205, 0.26, 0.29, 0.33]
    
    func checkIncome(isNumber: String) -> Bool{
        return !isNumber.isEmpty && Double(isNumber) != nil
    }
    
    func formatNumber(isNumber: Double) -> String{
        let formatter = NumberFormatter()
        
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3

        formatter.alwaysShowsDecimalSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        let num = formatter.string(from:NSNumber(value:isNumber))!
        
        return num
    }
    
    func setProvincialTax(){
        if (provinceValue == "AB"){
            selectedProvincialBracket = [142292.0, 170751.0, 227668.0, 341502.0]
            selectedProvincialRate = [0.1, 0.12, 0.13, 0.14, 0.15]
        }else if (provinceValue == "BC"){
            selectedProvincialBracket = [45654.0, 91310.0, 104835.0, 127299.0, 172602.0, 240716.0]
            selectedProvincialRate = [0.0506, 0.077, 0.105, 0.1229, 0.147, 0.168, 0.205]
        }else if (provinceValue == "MB"){
            selectedProvincialBracket = [35842.0, 79625.0]
            selectedProvincialRate = [0.108, 0.1275, 0.174]
        }else if (provinceValue == "NB"){
            selectedProvincialBracket = [47715.0, 95431.0, 176756.0]
            selectedProvincialRate = [0.094, 0.14, 0.16, 0.195]
        }else if (provinceValue == "NL"){
            selectedProvincialBracket = [41457.0, 82913.0, 148027.0, 207239.0, 264750.0, 529500.0, 1059000.0]
            selectedProvincialRate = [0.087, 0.145, 0.158, 0.178, 0.198, 0.208, 0.213, 0.218]
        }else if (provinceValue == "NS"){
            selectedProvincialBracket = [29590.0, 59180.0, 93000.0, 150000.0]
            selectedProvincialRate = [0.0879, 0.1495, 0.1667, 0.175, 0.21]
        }else if (provinceValue == "ON"){
            selectedProvincialBracket = [49231.0, 98463.0, 150000.0, 220000.0]
            selectedProvincialRate = [0.0505, 0.0915, 0.1116, 0.1216, 0.1316]
        }else if (provinceValue == "PEI"){
            selectedProvincialBracket = [31984.0, 63969.0]
            selectedProvincialRate = [0.098, 0.138, 0.167]
        }else if (provinceValue == "QC"){
            selectedProvincialBracket = [49275.0, 98540.0, 119910.0]
            selectedProvincialRate = [0.15, 0.20, 0.24, 0.2475]
        }else if (provinceValue == "SK"){
            selectedProvincialBracket = [49720.0, 142058.0]
            selectedProvincialRate = [0.105, 0.125, 0.145]
        }else if (provinceValue == "NT"){
            selectedProvincialBracket = [48326.0, 96655.0, 157139.0]
            selectedProvincialRate = [0.059, 0.086, 0.122, 0.1405]
        }else if (provinceValue == "NU"){
            selectedProvincialBracket = [50877.0, 101754.0, 165429.0]
            selectedProvincialRate = [0.04, 0.07, 0.09, 0.115]
        }else if (provinceValue == "YT"){
            selectedProvincialBracket = [53359.0, 106717.0, 165430.0, 500000.0]
            selectedProvincialRate = [0.064, 0.09, 0.109, 0.128, 0.15]
        }
    }
    
    func calculateEITax(income: Double) -> Double {
        let maxInsurableEarnings = 57400.0
        let employeeRate = 0.0188
        
        let employeeContribution = min(income, maxInsurableEarnings) * employeeRate

        return employeeContribution
    }
    
    func calculateCPPTax(income: Double) -> Double{
        let basicPeriodExemption = 3500.0 / 52
        
        let cpp = (income - basicPeriodExemption) * (5.70 / 100)
        
        return cpp
    }
    
    func calculateTax(income: Double, brackets: [Double], rates: [Double]) -> Double {
        var tax = 0.0
        var remainingIncome = income

        for i in 0..<brackets.count {
            if remainingIncome <= brackets[i] {
                tax += remainingIncome * rates[i]
                break
            } else {
                tax += brackets[i] * rates[i]
                remainingIncome -= brackets[i]
            }
        }

        return tax
    }
    
    func calculate(income: Double){
        setProvincialTax()
        
        federalTax = Float(calculateTax(income: income, brackets: federalBrackets, rates: federalRates))
        provinceTax = Float(calculateTax(income: income, brackets: selectedProvincialBracket, rates: selectedProvincialRate))
        eiDeduction = Float(calculateEITax(income: income))
        cppDeduction = Float(calculateCPPTax(income: income))
        
        totalTax = federalTax + provinceTax + eiDeduction + cppDeduction
        netIncome = grossIncomeValue - totalTax
    }
}
