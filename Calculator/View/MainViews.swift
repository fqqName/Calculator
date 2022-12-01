//
//  MainViews.swift
//  Calculator
//
//  Created by Pascal on 1.12.22.
//

import UIKit

class MainViews: UIView{
    //MARK: - views
    
    //    let calculations: UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.text = "0"
    //        return label
    //    }()
    
    let resultView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColor.indigo
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let underDisplayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = CustomColor.blueViolete
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextUnderDisplayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = CustomColor.darkOrchid
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func createButtonAction(title: String) -> ActionButton {
        let button = ActionButton()
        button.setTitle(title, for: .normal)
        button.tag = Int(title) ?? 0
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        //                button.font = UIFont.Weight.heavy
        return button
    }
    lazy var zero = createButtonAction(title: "0")
    lazy var one = createButtonAction(title: "1")
    lazy var two = createButtonAction(title: "2")
    lazy var three = createButtonAction(title: "3")
    lazy var four = createButtonAction(title: "4")
    lazy var five = createButtonAction(title: "5")
    lazy var six = createButtonAction(title: "6")
    lazy var seven = createButtonAction(title: "7")
    lazy var eight = createButtonAction(title: "8")
    lazy var nine = createButtonAction(title: "9")
    lazy var plus = createButtonAction(title: "+")
    lazy var minus = createButtonAction(title: "-")
    lazy var divide = createButtonAction(title: "/")
    lazy var multiply = createButtonAction(title: "*")
    lazy var percent = createButtonAction(title: "%")
    lazy var plusMinus = createButtonAction(title: "+/-")
    lazy var deleteLastItem = createButtonAction(title: "Del")
    lazy var defaultNum = createButtonAction(title: "C")
    lazy var dot = createButtonAction(title: ".")
    lazy var equal = createButtonAction(title: "=")
    
    lazy var calculatorElementes: [ActionButton] = [zero, one, two, three, four, five, six, seven, eight, nine, plus, minus, plusMinus, divide, multiply, percent, deleteLastItem, defaultNum, dot, equal]
    
    
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
        gradient.frame = self.bounds
        return gradient
    }()
    
    //MARK: - override init(frame: CGRect)
    override init(frame: CGRect) {
        super.init(frame: frame)
        gradient.frame = self.bounds
        self.layer.addSublayer(gradient)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -func
    
    func setupViews(){
        //        self.addSubview(calculations)
        self.addSubview(resultView)
        self.addSubview(displayLabel)
        self.addSubview(underDisplayLabel)
        self.addSubview(nextUnderDisplayLabel)
        
        self.addSubview(defaultNum)
        self.addSubview(plusMinus)
        self.addSubview(percent)
        self.addSubview(deleteLastItem)
        self.addSubview(seven)
        self.addSubview(eight)
        self.addSubview(nine)
        self.addSubview(divide)
        self.addSubview(four)
        self.addSubview(five)
        self.addSubview(six)
        self.addSubview(multiply)
        self.addSubview(one)
        self.addSubview(two)
        self.addSubview(three)
        self.addSubview(minus)
        self.addSubview(dot)
        self.addSubview(zero)
        self.addSubview(equal)
        self.addSubview(plus)
    }
    
    func setupConstraints(){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            resultView.widthAnchor.constraint(equalToConstant: self.bounds.width),
            resultView.heightAnchor.constraint(equalToConstant: self.bounds.height / 8),
            
            displayLabel.topAnchor.constraint(equalTo: resultView.topAnchor, constant: 5),
            displayLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -5),
            displayLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 5),
            displayLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -5),
            
            underDisplayLabel.topAnchor.constraint(equalTo: displayLabel.bottomAnchor),
            underDisplayLabel.widthAnchor.constraint(equalToConstant: self.bounds.width),
            underDisplayLabel.heightAnchor.constraint(equalToConstant: 10),
            
            nextUnderDisplayLabel.topAnchor.constraint(equalTo: underDisplayLabel.bottomAnchor),
            nextUnderDisplayLabel.widthAnchor.constraint(equalToConstant: self.bounds.width),
            nextUnderDisplayLabel.heightAnchor.constraint(equalToConstant: 10),
            
            //first level
            defaultNum.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            defaultNum.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            defaultNum.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            plusMinus.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            plusMinus.leadingAnchor.constraint(equalTo: defaultNum.trailingAnchor, constant: 1),
            plusMinus.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            percent.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            percent.leadingAnchor.constraint(equalTo: plusMinus.trailingAnchor, constant: 1),
            percent.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            deleteLastItem.topAnchor.constraint(equalTo: nextUnderDisplayLabel.bottomAnchor),
            deleteLastItem.leadingAnchor.constraint(equalTo: percent.trailingAnchor, constant: 1),
            deleteLastItem.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            //second level
            seven.topAnchor.constraint(equalTo: defaultNum.bottomAnchor),
            seven.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1),
            seven.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            eight.topAnchor.constraint(equalTo: plusMinus.bottomAnchor),
            eight.leadingAnchor.constraint(equalTo: seven.trailingAnchor),
            eight.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            nine.topAnchor.constraint(equalTo: percent.bottomAnchor),
            nine.leadingAnchor.constraint(equalTo: eight.trailingAnchor),
            nine.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            divide.topAnchor.constraint(equalTo: deleteLastItem.bottomAnchor),
            divide.leadingAnchor.constraint(equalTo: nine.trailingAnchor),
            divide.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            // third level
            four.topAnchor.constraint(equalTo: seven.bottomAnchor),
            four.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            four.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            five.topAnchor.constraint(equalTo: eight.bottomAnchor),
            five.leadingAnchor.constraint(equalTo: four.trailingAnchor),
            five.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            six.topAnchor.constraint(equalTo: nine.bottomAnchor),
            six.leadingAnchor.constraint(equalTo: five.trailingAnchor),
            six.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            multiply.topAnchor.constraint(equalTo: divide.bottomAnchor),
            multiply.leadingAnchor.constraint(equalTo: six.trailingAnchor),
            multiply.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            // fourth level
            one.topAnchor.constraint(equalTo: four.bottomAnchor),
            one.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            one.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            two.topAnchor.constraint(equalTo: five.bottomAnchor),
            two.leadingAnchor.constraint(equalTo: one.trailingAnchor),
            two.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            three.topAnchor.constraint(equalTo: six.bottomAnchor),
            three.leadingAnchor.constraint(equalTo: two.trailingAnchor),
            three.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            minus.topAnchor.constraint(equalTo: multiply.bottomAnchor),
            minus.leadingAnchor.constraint(equalTo: three.trailingAnchor),
            minus.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            //last level
            dot.topAnchor.constraint(equalTo: one.bottomAnchor),
            dot.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dot.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            dot.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            
            zero.topAnchor.constraint(equalTo: two.bottomAnchor),
            zero.leadingAnchor.constraint(equalTo: dot.trailingAnchor),
            zero.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            equal.topAnchor.constraint(equalTo: three.bottomAnchor),
            equal.leadingAnchor.constraint(equalTo: zero.trailingAnchor),
            equal.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
            
            plus.topAnchor.constraint(equalTo: minus.bottomAnchor),
            plus.leadingAnchor.constraint(equalTo: equal.trailingAnchor),
            plus.widthAnchor.constraint(equalToConstant: self.bounds.width / 4),
        ])
        
        
    }
    
    
    
}
