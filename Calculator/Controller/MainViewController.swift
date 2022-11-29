//
//  MainViewController.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    private let resultView : UIView = {
        let view = UIView()
        view.backgroundColor = CustomColor.indigo
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var displayLabel: UILabel = {
        let label = UILabel()
        label.text = "23423423423"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let underDisplayLabel: UIView = {
        let label = UIView()
        label.backgroundColor = CustomColor.blueViolete
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextUnderDisplayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = CustomColor.darkOrchid
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            
            CustomColor.indigo.cgColor,
            CustomColor.blueViolete.cgColor,
            CustomColor.darkOrchid.cgColor,
            
        ]
        
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.frame = view.bounds
        return gradient
    }()
    
    private func createButtonAction(title: String) -> ActionButton {
        let button = ActionButton()
        button.setTitle(title, for: .normal)
        button.tag = Int(title) ?? 0
//        button.font = UIFont.Weight.heavy
        return button
    }
    private lazy var zero: ActionButton = createButtonAction(title: "0")
    private lazy var one: ActionButton = createButtonAction(title: "1")
    private lazy var two: ActionButton = createButtonAction(title: "2")
    private lazy var three: ActionButton = createButtonAction(title: "3")
    private lazy var four: ActionButton = createButtonAction(title: "4")
    private lazy var five: ActionButton = createButtonAction(title: "5")
    private lazy var six: ActionButton = createButtonAction(title: "6")
    private lazy var seven: ActionButton = createButtonAction(title: "7")
    private lazy var eight: ActionButton = createButtonAction(title: "8")
    private lazy var nine: ActionButton = createButtonAction(title: "9")
    private lazy var plus: ActionButton = createButtonAction(title: "+")
    private lazy var minus: ActionButton = createButtonAction(title: "-")
    private lazy var divide: ActionButton = createButtonAction(title: "/")
    private lazy var multiply: ActionButton = createButtonAction(title: "*")
    private lazy var percent: ActionButton = createButtonAction(title: "%")
    private lazy var plusMinus: ActionButton = createButtonAction(title: "+/-")
    private lazy var deleteLastItem: ActionButton = createButtonAction(title: "Del")
    private lazy var defaultNum = createButtonAction(title: "C")
    private lazy var dot = createButtonAction(title: ".")
    private lazy var equal = createButtonAction(title: "=")
    
    lazy var calculatorElementes: [ActionButton] = [zero, one, two, three, four, five, six, seven, eight, nine, plus, minus, plusMinus, divide, multiply, percent, deleteLastItem, defaultNum, dot, equal]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        gradient.frame = view.bounds
        self.view.layer.addSublayer(gradient)
        
        addViews()
        createConstraint()
    }
    func addSubviewActionButton(array: [ActionButton]){
        for n in 1...array.count{
            
        }
    }
    func addViews(){
        view.addSubview(resultView)
        view.addSubview(displayLabel)
        view.addSubview(underDisplayLabel)
        view.addSubview(nextUnderDisplayLabel)
        
        view.addSubview(defaultNum)
        view.addSubview(plusMinus)
        view.addSubview(percent)
        view.addSubview(deleteLastItem)
        view.addSubview(seven)
        view.addSubview(eight)
        view.addSubview(nine)
        view.addSubview(divide)
        view.addSubview(four)
        view.addSubview(five)
        view.addSubview(six)
        view.addSubview(multiply)
        view.addSubview(one)
        view.addSubview(two)
        view.addSubview(three)
        view.addSubview(minus)
        view.addSubview(dot)
        view.addSubview(zero)
        view.addSubview(equal)
        view.addSubview(plus)
    }
    
    func createConstraint(){
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            resultView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            resultView.heightAnchor.constraint(equalToConstant: view.bounds.height / 8),
            
            displayLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 5),
            displayLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -5),
            displayLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 5),
            displayLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -5),
            
            underDisplayLabel.topAnchor.constraint(equalTo: displayLabel.bottomAnchor),
            underDisplayLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            underDisplayLabel.heightAnchor.constraint(equalToConstant: 10),
            
            nextUnderDisplayLabel.topAnchor.constraint(equalTo: underDisplayLabel.bottomAnchor),
            nextUnderDisplayLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            nextUnderDisplayLabel.heightAnchor.constraint(equalToConstant: 10),
            
            //first level
            defaultNum.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            defaultNum.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            defaultNum.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            plusMinus.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            plusMinus.leadingAnchor.constraint(equalTo: defaultNum.trailingAnchor, constant: 1),
            plusMinus.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            percent.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            percent.leadingAnchor.constraint(equalTo: plusMinus.trailingAnchor, constant: 1),
            percent.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            deleteLastItem.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            deleteLastItem.leadingAnchor.constraint(equalTo: percent.trailingAnchor, constant: 1),
            deleteLastItem.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            //second level
            seven.topAnchor.constraint(equalTo: defaultNum.bottomAnchor),
            seven.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1),
            seven.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            eight.topAnchor.constraint(equalTo: plusMinus.bottomAnchor),
            eight.leadingAnchor.constraint(equalTo: seven.trailingAnchor),
            eight.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            nine.topAnchor.constraint(equalTo: percent.bottomAnchor),
            nine.leadingAnchor.constraint(equalTo: eight.trailingAnchor),
            nine.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            divide.topAnchor.constraint(equalTo: deleteLastItem.bottomAnchor),
            divide.leadingAnchor.constraint(equalTo: nine.trailingAnchor),
            divide.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            // third level
            four.topAnchor.constraint(equalTo: seven.bottomAnchor),
            four.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            four.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            five.topAnchor.constraint(equalTo: eight.bottomAnchor),
            five.leadingAnchor.constraint(equalTo: four.trailingAnchor),
            five.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            six.topAnchor.constraint(equalTo: nine.bottomAnchor),
            six.leadingAnchor.constraint(equalTo: five.trailingAnchor),
            six.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            multiply.topAnchor.constraint(equalTo: divide.bottomAnchor),
            multiply.leadingAnchor.constraint(equalTo: six.trailingAnchor),
            multiply.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            // fourth level
            one.topAnchor.constraint(equalTo: four.bottomAnchor),
            one.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            one.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            two.topAnchor.constraint(equalTo: five.bottomAnchor),
            two.leadingAnchor.constraint(equalTo: one.trailingAnchor),
            two.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            three.topAnchor.constraint(equalTo: six.bottomAnchor),
            three.leadingAnchor.constraint(equalTo: two.trailingAnchor),
            three.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            minus.topAnchor.constraint(equalTo: multiply.bottomAnchor),
            minus.leadingAnchor.constraint(equalTo: three.trailingAnchor),
            minus.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            //last level
            dot.topAnchor.constraint(equalTo: one.bottomAnchor),
            dot.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dot.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            dot.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            zero.topAnchor.constraint(equalTo: two.bottomAnchor),
            zero.leadingAnchor.constraint(equalTo: dot.trailingAnchor),
            zero.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            equal.topAnchor.constraint(equalTo: three.bottomAnchor),
            equal.leadingAnchor.constraint(equalTo: zero.trailingAnchor),
            equal.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
            
            plus.topAnchor.constraint(equalTo: minus.bottomAnchor),
            plus.leadingAnchor.constraint(equalTo: equal.trailingAnchor),
            plus.widthAnchor.constraint(equalToConstant: view.bounds.width / 4),
        ])
    }
}
