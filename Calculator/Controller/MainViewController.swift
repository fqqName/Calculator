//
//  MainViewController.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var mainViews: MainViews{ return self.view as! MainViews}
    private var calculatorLogic = CalculatorLogic()
    private var isFinishedTypingNumber : Bool = true
    private var numberOneText: String = ""
    private var numberTwoText: String = ""
    private var repeatCalc: Bool = false
    
    //        private var displayValue: Double {
    //            get{
    //                guard let number = Double(mainViews.displayLabel.text!) else {
    //                    fatalError("Cannot convert display text to a Double.")
    //                }
    //                return number
    //            }
    //            set{
    //                mainViews.displayLabel.text = String(newValue.clean)
    //            }
    //        }
    
    private var calculationValue: String {
        get{
            return mainViews.calculations.text ?? ""
        }
        set{
            mainViews.calculations.text = String(newValue)
        }
    }
    
    //MARK: -loadView
    override func loadView() {
        self.view = MainViews(frame: UIScreen.main.bounds)
        mainViews.displayLabel.text = "14"
    }
    
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViews.one.addTarget(self, action: #selector(addOne), for: .touchUpInside)
        self.mainViews.two.addTarget(self, action: #selector(addTwo), for: .touchUpInside)
        self.mainViews.three.addTarget(self, action: #selector(addThree), for: .touchUpInside)
        self.mainViews.four.addTarget(self, action: #selector(addFour), for: .touchUpInside)
        self.mainViews.five.addTarget(self, action: #selector(addFive), for: .touchUpInside)
        self.mainViews.six.addTarget(self, action: #selector(addSix), for: .touchUpInside)
        self.mainViews.seven.addTarget(self, action: #selector(addSeven), for: .touchUpInside)
        self.mainViews.eight.addTarget(self, action: #selector(addEighth), for: .touchUpInside)
        self.mainViews.nine.addTarget(self, action: #selector(addNine), for: .touchUpInside)
        self.mainViews.zero.addTarget(self, action: #selector(addZero), for: .touchUpInside)
        
        self.mainViews.defaultNum.addTarget(self, action: #selector(resetData), for: .touchUpInside)
        self.mainViews.deleteLastItem.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        self.mainViews.plusMinus.addTarget(self, action: #selector(plusMinus), for: .touchUpInside)
        
        self.mainViews.plus.addTarget(self, action: #selector(add), for: .touchUpInside)
        self.mainViews.minus.addTarget(self, action: #selector(subtract), for: .touchUpInside)
        self.mainViews.multiply.addTarget(self, action: #selector(multiply), for: .touchUpInside)
        self.mainViews.divide.addTarget(self, action: #selector(divide), for: .touchUpInside)
//        addActionToActionButtons(array: mainViews.numberElements)
    }
    
    
    func addActionToActionButtons(array: [ActionButton]){
        for i in 0 ..< array.count {
            array[i].addTarget(self, action: #selector(testPrintHello), for: .touchUpInside)
        }
    }
    
//    func result(numberOne: String, numberTwo: String, operation: OperationType.Type) -> String{
//        //        let numbers =  String(Int(numberOne) )
//        return ""
//    }
    
    @objc func testPrintHello() {
        print("hello world")
        mainViews.displayLabel.text = "1488"
    }
    //MARK: - calculator functions 
    @objc func resetData() {
        mainViews.displayLabel.text! = "0"
    }
    
    @objc func add() {
        calculatorLogic.opertion = CalculatorLogic.OperationType.add
        cleanStoreNum()
    }
    
    @objc func subtract() {
        calculatorLogic.opertion = CalculatorLogic.OperationType.subtract
    }
    
    @objc func divide() {
        calculatorLogic.opertion = CalculatorLogic.OperationType.divide
    }
    
    @objc func multiply() {
        calculatorLogic.opertion = CalculatorLogic.OperationType.multiply
    }
    
    
    @objc func plusMinus() {
        numberOneText = mainViews.displayLabel.text!
        let number =  (-1*(Int(numberOneText) ?? 0))
        numberTwoText = String(number)
        mainViews.displayLabel.text! = numberTwoText
        numberOneText = ""
        numberTwoText = ""
    }
    
    func cleanStoreNum() {
        print("cleanStoreNum")
        if (Float(mainViews.displayLabel.text!)! > 0) {
            mainViews.displayLabel.text = "0"        }
    }
    
    @objc func backButtonPressed() {
        if let currentNumber = mainViews.displayLabel.text {
            var newNumber = String(currentNumber.dropLast())
            if newNumber.count < 1{
                newNumber = "0"
                isFinishedTypingNumber = true
            }
            mainViews.displayLabel.text =  newNumber
        }
    }
    
    //TODO: - wtite switch if symbol = "symbol" then print "symbol"
    
    //MARK: - numbers
    @objc func addOne() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.one.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.one.tag)
            print("add one")
        }
        
    }
    
    @objc func addTwo() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.two.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.two.tag)
            print("add two")
        }
    }
    
    @objc func addThree() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.three.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.three.tag)
            print("add three")
        }
    }
    
    @objc func addFour() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.four.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.four.tag)
            print("add four")
        }
    }
    
    @objc func addFive() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.five.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.five.tag)
            print("add five")
        }
    }
    
    @objc func addSix() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.six.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.six.tag)
            print("add six")
        }
    }
    
    @objc func addSeven() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.seven.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.seven.tag)
            print("add seven")
        }
    }
    
    @objc func addEighth() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.eight.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.eight.tag)
            print("add eighth")
        }
    }
    
    @objc func addNine() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.nine.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.nine.tag)
            print("add nine")
        }
    }
    
    @objc func addZero() {
        if mainViews.displayLabel.text! == "0"{
            mainViews.displayLabel.text! = numberOneText
            mainViews.displayLabel.text! += String(mainViews.zero.tag)
        }else{
            mainViews.displayLabel.text! += String(mainViews.zero.tag)
            print("add zero")
        }
    }
    
    //
    //    @objc func addOperation() {
    //        numberOneText = mainViews.displayLabel.text ?? ""
    //        mainViews.displayLabel.text = ""
    //
    //    }
    
    
    //    func calcButtonPressed(_ sender: ActionButton) {
    //        print("one press")
    //        //What should happen when a non-number button is pressed
    //        isFinishedTypingNumber = true
    //
    //        calculatorLogic.setNumber(displayValue)
    //
    //        if let calcMethod = sender.currentTitle {
    //
    //            let result = calculatorLogic.calculate(symbol: calcMethod)
    //            if let resultValue = result.result{
    //                displayValue = resultValue
    //            }
    //            if let calcValue = result.calc {
    //                calculationValue = calcValue
    //            }
    //        }
    //    }
    
    
    //    @objc func numButtonPressed(_ sender: ActionButton) {
    //
    //        //What should happen when a number is entered into the keypad
    //
    //        if let numValue = sender.currentTitle {
    //
    //            if isFinishedTypingNumber{
    //                mainViews.calculations.text = numValue
    //                isFinishedTypingNumber = false
    //            }else{
    //
    //                if numValue == "." {
    //
    //                    let isInt = floor(displayValue) == displayValue
    //
    //                    if !isInt {
    //                        return
    //                    }
    //                }
    //
    //                mainViews.calculations.text = mainViews.calculations.text! + numValue
    //            }
    //
    //        }
    //
    //    }
    
    
}


extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}

