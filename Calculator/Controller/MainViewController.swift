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
        //        self.mainViews.four.addTarget(self, action: #selector(addFour), for: .touchUpInside)
        //        self.mainViews.five.addTarget(self, action: #selector(addFive), for: .touchUpInside)
        //        self.mainViews.six.addTarget(self, action: #selector(addSix), for: .touchUpInside)
        //        self.mainViews.seven.addTarget(self, action: #selector(addSeven), for: .touchUpInside)
        //        self.mainViews.eight.addTarget(self, action: #selector(addEighth), for: .touchUpInside)
        //        self.mainViews.nine.addTarget(self, action: #selector(addNine), for: .touchUpInside)
        //        addActionToActionButtons(array: mainViews.calculatorElementes)
        self.mainViews.deleteLastItem.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    
    //    func addActionToActionButtons(array: [ActionButton]){
    //        for i in 0 ..< array.count {
    //            array[i].addTarget(self, action: #selector(testPrint), for: .touchUpInside)
    //
    //        }
    //    }
    
    func result(numberOne: String, numberTwo: String, operation: OperationType.Type) -> String{
        //        let numbers =  String(Int(numberOne) )
        return ""
    }
    @objc func testPrintHello() {
        print("hello world")
        mainViews.displayLabel.text = "1488"
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
    @objc func addOne() {
        mainViews.displayLabel.text! += String(mainViews.one.tag)
        print("add one")
    }
    
    @objc func addTwo() {
        mainViews.displayLabel.text! += String(mainViews.two.tag)
        print("add two")
    }
    
    @objc func addThree() {
        mainViews.displayLabel.text! += String(mainViews.three.tag)
        print("add three")
    }
    
    @objc func addFour() {
        //        mainViews.displayLabel.text! += String(mainViews.four.tag)
        //        print("add four")
        //    }
        //
        //    @objc func addFive() {
        //        mainViews.displayLabel.text! += String(mainViews.five.tag)
        //        print("add four")
        //    }
        //
        //    @objc func addSix() {
        //        mainViews.displayLabel.text! += String(mainViews.six.tag)
        //        print("add four")
        //    }
        //
        //    @objc func addSeven() {
        //        mainViews.displayLabel.text! += String(mainViews.seven.tag)
        //        print("Add Seven")
        //    }
        //
        //    @objc func addEighth() {
        //        mainViews.displayLabel.text! += String(mainViews.eight.tag)
        //        print("add eighth")
        //    }
        //
        //    @objc func addNine() {
        //        mainViews.displayLabel.text! += String(mainViews.nine.tag)
        //        print("add nine")
        //    }
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
    }
    
    
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
