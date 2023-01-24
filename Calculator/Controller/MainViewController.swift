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
    
    private var displayValue: Double {
        get{
            guard let number = Double(mainViews.displayLabel.text!) else {
                fatalError("Cannot convert display text to a Double.")
            }
            return number
        }
        set{
            mainViews.displayLabel.text = String(newValue.clean)
        }
    }
    
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
        
        addActionToButton()
        
    }
    
    func addActionToButton() {
        self.addActionToActionButtons(array: mainViews.numberElements)
        self.addFunctionButton(array: mainViews.calculatorElementes)
        self.mainViews.dot.addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        self.mainViews.deleteLastItem.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    func addActionToActionButtons(array: [ActionButton]){
        for i in 0 ..< array.count {
            array[i].addTarget(self, action: #selector(numButtonPress), for: .touchUpInside)
        }
    }
    
    func addFunctionButton(array: [ActionButton]) {
        for i in 0 ..< array.count {
            array[i].addTarget(self, action: #selector(calcButtonPressed), for: .touchUpInside)
        }
    }
    
    //MARK: DEL last item
    @objc func backButtonPressed() {
        if !isFinishedTypingNumber {
            if let currentNumber = mainViews.displayLabel.text {
                var newNumber = String(currentNumber.dropLast())
                if newNumber.count < 1{
                    newNumber = "0"
                    isFinishedTypingNumber = true
                }
                mainViews.displayLabel.text =   newNumber
            }
        }
    }
    
    //MARK: - numbers
    @objc func numButtonPress(_ sender: ActionButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber{
                mainViews.displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                mainViews.displayLabel.text = mainViews.displayLabel.text! + numValue
            }
        }
    }
    
    //MARK: - calculation buttons
    @objc func calcButtonPressed(_ sender: ActionButton) {
        isFinishedTypingNumber = true
        calculatorLogic.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            let result = calculatorLogic.calculate(symbol: calcMethod)
            if let resultValue = result.result{
                displayValue = resultValue
            }
            if let calcValue = result.calc {
                calculationValue = calcValue
            }
        }
    }
    
}
