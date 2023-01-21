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
    var testNumber: Double = 0
    
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
        mainViews.displayLabel.text = "0"
    }
    
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViews.one.addTarget(self, action: #selector(testPrintHello), for: .touchUpInside)
        self.mainViews.two.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.three.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.four.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.five.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.six.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.seven.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.eight.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.nine.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.zero.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        
        self.mainViews.defaultNum.addTarget(self, action: #selector(resetData), for: .touchUpInside)
        self.mainViews.deleteLastItem.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        self.mainViews.plusMinus.addTarget(self, action: #selector(plusMinus), for: .touchUpInside)
        
        self.mainViews.plus.addTarget(self, action: #selector(add), for: .touchUpInside)
        self.mainViews.minus.addTarget(self, action: #selector(subtract), for: .touchUpInside)
        self.mainViews.multiply.addTarget(self, action: #selector(multiply), for: .touchUpInside)
        self.mainViews.divide.addTarget(self, action: #selector(divide), for: .touchUpInside)
        self.mainViews.equal.addTarget(self, action: #selector(equal), for: .touchUpInside)
        //        addActionToActionButtons(array: mainViews.numberElements)
    }
    
    
    func addActionToActionButtons(array: [ActionButton]){
        for i in 0 ..< array.count {
            array[i].addTarget(self, action: #selector(testPrintHello), for: .touchUpInside)
        }
    }
    
    @objc func testPrintHello() {
        print("hello world")
        mainViews.displayLabel.text = "1488"
    }
    
    //    func result(numberOne: String, numberTwo: String, operation: OperationType.Type) -> String{
    //        //        let numbers =  String(Int(numberOne) )
    //        return ""
    //    }
    
    
    //MARK: - calculator functions
    func checkModelData() {
        print("calculatorLogic opertion \(calculatorLogic.opertion) ")
        print("num One = \(calculatorLogic.numberOne)")
        print("num two = \(calculatorLogic.numberTwo)")
    }
    
    @objc func resetData() {
        mainViews.displayLabel.text! = "0"
        isFinishedTypingNumber = true
        calculatorLogic.clear()
        checkModelData()
    }
    
    @objc func add() {
        calculatorLogic.opertion = .add
        isFinishedTypingNumber = false
        if isFinishedTypingNumber == true {
            
            print("operation = \(calculatorLogic.opertion)")
            calculatorLogic.calculateNum()
        }else{
            cleanStoreNum()
        }
        checkModelData()
    }
    
    @objc func subtract() {
        if calculatorLogic.opertion != .none{
            
        }
        calculatorLogic.opertion = CalculatorLogic.OperationType.subtract
        cleanStoreNum()
        checkModelData()
    }
    
    @objc func divide() {
        calculatorLogic.opertion = CalculatorLogic.OperationType.divide
        cleanStoreNum()
        checkModelData()
    }
    
    @objc func multiply() {
        calculatorLogic.opertion = CalculatorLogic.OperationType.multiply
        cleanStoreNum()
        testPrintHello()
    }
    
    @objc func equal() {
        //        print(calculatorLogic.opertion)
        //        mainViews.displayLabel.text! = String(calculatorLogic.calculateNum())
        //        if (!isFinishedTypingNumber) {
        //            calculatorLogic.numberTwo = Double(mainViews.displayLabel.text!) ?? 0
        //            mainViews.displayLabel.text! = String(calculatorLogic.calculateNum())
        //            isFinishedTypingNumber = true
        //
        //        }else{
        //            calculatorLogic.numberOne = Double(calculatorLogic.calculateNum())
        //            mainViews.displayLabel.text! = String(calculatorLogic.calculateNum())
        //        }
        print("calculatorLogic opertion \(calculatorLogic.opertion) ")
        print("num One = \(calculatorLogic.numberOne)")
        print("num two = \(calculatorLogic.numberTwo)")
        
    }
    
    
    @objc func plusMinus() {
        numberOneText = mainViews.displayLabel.text!
        let number =  (-1*(Int(numberOneText) ?? 0))
        numberTwoText = String(number)
        mainViews.displayLabel.text! = numberTwoText
        numberOneText = ""
        numberTwoText = ""
        checkModelData()
    }
    
    func cleanStoreNum() {
        print("cleanStoreNum")
        if (Float(mainViews.displayLabel.text!)! > 0) {
            mainViews.displayLabel.text = "0"
            checkModelData()
        }
    }
    
    @objc func backButtonPressed() {
        if !isFinishedTypingNumber {
            if let currentNumber = mainViews.displayLabel.text {
                var newNumber = String(currentNumber.dropLast())
                if newNumber.count < 1{
                    newNumber = "0"
                    isFinishedTypingNumber = true
                }
                mainViews.displayLabel.text =  newNumber
            }
        }
    }

    //MARK: - numbers
    @objc func numButtonPress(_ sender: ActionButton) {
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber {
                if mainViews.displayLabel.text! == "0"{
                    mainViews.displayLabel.text! = ""
                    mainViews.displayLabel.text! = mainViews.displayLabel.text! + numValue
                } else {
                    mainViews.displayLabel.text! = mainViews.displayLabel.text! + numValue
                }
            }
        }
        checkModelData()
    }
    
}


extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}

