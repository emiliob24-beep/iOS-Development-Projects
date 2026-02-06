//
//  Calculator.swift
//  Calculator Project
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable
class Calculator {
    var displayedString = "0"
    //    var firstNumber: Int? = nil
    var currentOperator: Int? = nil
    var isTypingNumber = Bool()
    //    var currentOperation: String?
    //    private var display = "0"
    private var firstNumber: Double?
    private var secondNumber: Double?
    private var currentOperation: String?
    // Any time you update this String, it will display on the calculator.
    
    // Add additional variables here.
    
    func handleInput(_ input: CalculatorInput) {
        // Each case below represents a single button pressed on the calculator. Add a function for each; the default case covers the number buttons and has been set up for you, but feel free to change this as you see fit.
        
        switch input {
        case .backspace:
            backspaceTapped()
        case .clear:
            clearTapped()
        case .percent:
            percentOf()
        case .divide:
            division()
        case .multiply:
            multiplication()
        case .subtract:
            substraction()
        case .add:
            addition()
        case .invertSign:
            invertSignTapped()
        case .decimal:
            decimalPoint()
        case .equal:
            equalSign()
        default:
            number(Int(input.rawValue)!)
        }
    }
    func operationTapped(_ operation: String) {
        firstNumber = Double(displayedString)
        currentOperation = operation
        displayedString = ""
    }
    func equalSign() {
        guard let first = firstNumber,
                let operation = currentOperation,
              let second = Double(displayedString) else { return }
        var result: Double = 0
        
        switch operation {
        case "+":
            result = first + second
        case "-":
            result = first - second
        case "×":
            result = first * second
        case "÷":
            result = second == 0 ? 0 : first / second
        default:
            break
        }
        displayedString = String(format: "%g", result)
        firstNumber = nil
        currentOperation = nil
    }
    func buttonTapped(_ value: String) {
        switch value {
        case "+", "−", "×", "÷":
            operationTapped(value)
        case "=":
            equalSign()
        case "%":
            percentOf()
        default:
            displayedString = displayedString == "" ? value : displayedString + value
        }
    }

    
    func decimalPoint() {
    }
    
    func invertSignTapped() {
    }
    
    func addition() {
        operationTapped("+")
    }
    
    func substraction() {
       operationTapped("-")
    }
    
    func multiplication() {
        operationTapped("×")
    }
    
    func division() {
       operationTapped("÷")
    }
    
    func percentOf() {
       operationTapped("%")
    }
    
    func clearTapped() {
        displayedString = ""
        firstNumber = nil
        currentOperator = nil
        isTypingNumber = false
    }
    
    func backspaceTapped() {
        displayedString = String(displayedString.dropLast())
    }
    
    func number(_ number: Int) {
        displayedString += "\(number)"
    }
}


#Preview {
    ContentView()
}
