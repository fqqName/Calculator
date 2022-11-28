//
//  ActionButton.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

class ActionButton: UIButton{
    let gradient = CAGradientLayer()
    
    required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        setup()
        gradient.frame = bounds
        layer.addSublayer(gradient)
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0.25, 0.50, 0.75, 1]
        gradient.type = .radial
        gradient.frame = bounds
        gradient.colors = [
            
            CustomColor.darkOrchid.cgColor,
            CustomColor.indigo.cgColor,
            CustomColor.blueViolete.cgColor,
            CustomColor.Cyan.cgColor,
            
        ]
        
    }
    
    func setup(){
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 20
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    override var isHighlighted: Bool{
        didSet{
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve])
            {[self] in
                if isHighlighted{
                    backgroundColor = UIColor.white
                    
                }
            }
        }
    }
}
