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
//    func operationTapped(_ operation: String) {
//        firstNumber = Double(displayedString)
//        currentOperation = operation
//        displayedString = "0"
    func operationTapped(_ operation: String) {
        if let existingOp = currentOperation,
            let first = firstNumber,
           let second = Double(displayedString) {
            //Compute intermediate result
            var result: Double = 0
            switch existingOp {
            case "+":
                result = first + second
            case "-":
                result = first - second
            case "×":
                result = first * second
            case "÷":
                result = second == 0 ? 0 : first / second
            default:
                result = second
            }
            //Update for chaining
            firstNumber = result
            displayedString = String(format: "%g", result)
        } else {
            //First operator
            firstNumber = Double(displayedString)
        }
        //Set the new pending operation and prepare for next number
        currentOperation = operation
        displayedString = "0"
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
//            operationTapped(value)
//        case "%":
//            percentOf()
//           operationTapped(value)
        default:
            displayedString = displayedString == "0" ? value : displayedString + value
        }
    }

    
    func decimalPoint() {
//If starting a new entry
        if displayedString.isEmpty {
            displayedString = "0"
            return
        }
//If the current display is "0", make it "0."
        if displayedString == "0" {
            displayedString = "0."
            return
        }
//Prevent multiple decimals
        if displayedString.contains("."){
            return
        }
//Append a decimal
        displayedString += "."
    }
    
    func invertSignTapped() {
        if displayedString.isEmpty {
            displayedString = "0"
            return
        }
        if let value = Double(displayedString) {
            let flipped = -value
            
            if flipped == 0 {
                displayedString = "0"
            } else {
                displayedString = String(format: "%g", flipped)
            }
        } else {
            displayedString = "0"
        }
        
    }
    func percentOf() {
//If display is empty, treat as "0"
        if displayedString.isEmpty {
            displayedString = "0"
            return
        }
        if let value = Double(displayedString) {
            let percent = value / 100.0
            displayedString = String(format: "%g", percent)
        } else {
            displayedString = "0"
        }
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
    
    func clearTapped() {
        displayedString = "0"
        firstNumber = nil
        currentOperator = nil
        isTypingNumber = false
    }
    
    func backspaceTapped() {
        if !displayedString.isEmpty {
            displayedString.removeLast()
        }
        if displayedString.isEmpty {
            displayedString = "0"
        }
    }
    
    func number(_ number: Int) {
        if displayedString == "0" {
            displayedString = "\(number)"
        } else {
            displayedString +=  "\(number)"
        }
    }
}


#Preview {
    ContentView()
}
