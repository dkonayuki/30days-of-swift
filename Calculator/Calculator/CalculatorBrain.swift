//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by dkonayuki on 4/3/16.
//  Copyright © 2016 ChillBears. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private enum Op: CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()

    //dictionary <String, Op>
    private var knownOps = [String:Op]()

    init() {
        func learnOp(op: Op) {
            knownOps[op.description] = op
        }
        
        learnOp(Op.BinaryOperation("x", *))
        
        knownOps["-"] = Op.BinaryOperation("-", { $1 / $0 })
        knownOps["÷"] = Op.BinaryOperation("÷", { $1 / $0 })
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        if (!ops.isEmpty) {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
                case Op.Operand(let operand):
                    return (operand, remainingOps)
                case Op.UnaryOperation(_, let operation):
                    let operandEvaluation = evaluate(remainingOps)
                    if let operand = operandEvaluation.result {
                        return (operation(operand), operandEvaluation.remainingOps)
                    }
                case Op.BinaryOperation(_, let operation):
                    let op1Evaluation = evaluate(remainingOps)
                    if let operand1 = op1Evaluation.result {
                        let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                        if let operand2 = op2Evaluation.result {
                            return (operation(operand1, operand2), op2Evaluation.remainingOps)
                        }
                    }
                }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainder) left over.")
        return result
    }
    
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
}