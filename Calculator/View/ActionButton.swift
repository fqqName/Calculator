//
//  ActionButton.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

class ActionButton: UIButton{
    
    init(){
        super.init(frame: .zero)
        
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        setTitleColor(CustomColor.darkOrchid, for: .highlighted)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
//        widthAnchor.constraint(equalToConstant: bounds.height / 4).isActive = true
//        heightAnchor.constraint(equalToConstant: bounds.height / 4).isActive = true
        layer.cornerRadius = frame.height / 2
        
    }
    
    override var isHighlighted: Bool{
        didSet {
            UIView.transition(with: self, duration: 0.05, options: [.transitionCrossDissolve])
            {[self] in
                if isHighlighted{
                    backgroundColor = CustomColor.indigo.withAlphaComponent(0.9)
                }else{
                    backgroundColor = nil
                }
            }
        }
    }
}
