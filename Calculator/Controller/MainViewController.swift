//
//  MainViewController.swift
//  Calculator
//
//  Created by Mikita Piatrushka on 25.11.22.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var mainViews: MainViews{ return self.view as! MainViews}
    

    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = MainViews(frame: UIScreen.main.bounds)
    }
    

}   
