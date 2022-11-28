//
//  MainViewController.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

class MainViewController: UIViewController {
    
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
//        gradient.locations = [0.25, 0.50, 1]
        gradient.frame = view.bounds
        return gradient
    }()
    
    private let button: ActionButton = {
        let button = ActionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        gradient.frame = view.bounds
        self.view.layer.addSublayer(gradient)
    
        addViews()
        createConstraint()
    }
    
    func addViews(){
//        view.addSubview(button)
    }
    
    func createConstraint(){
        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
