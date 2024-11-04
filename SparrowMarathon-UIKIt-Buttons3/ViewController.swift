//
//  ViewController.swift
//  SparrowMarathon-UIKIt-Buttons3
//
//  Created by Sergey Leontiev on 4.11.24..
//

import UIKit

class ViewController: UIViewController {
    private var firstButton = ResultButton(title: "First Button")
    private var secondButton = ResultButton(title: "Second Medium Button")
    private var thirdButton = ResultButton(title: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
