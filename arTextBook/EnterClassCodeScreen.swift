//
//  ViewController.swift
//  myTextbooksAR
//
//  Created by Iccha Singh on 9/6/19.
//  Copyright © 2019 Iccha Singh. All rights reserved.
//

import UIKit

class EnterClassCodeScreen: UIViewController {
    
    lazy var entryField: UITextField = {
        let field = UITextField(frame: CGRect(x: 20, y: 50, width: self.view.frame.width * 0.8, height: 50))
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.borderWidth = 1.0
        
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setUpLayout()
        loadTextbooks()
    }
    
    lazy var entryLabel: UITextField = {
        let label = UITextField(frame: .zero)
        label.text = "Hello World"
        
        return label
    }()
    
    lazy var entryButton: UIButton = {
        let button = UIButton(frame: .zero)
        
        button.backgroundColor = UIColor.black
        button.titleLabel?.textColor = UIColor.white
        button.setTitle("Log in", for: .normal)
        button.addTarget(self, action: #selector(loadTextbooks), for: .touchDown) //button click tiggers calling of function
        
        return button
    }()
    
    
    @objc func loadTextbooks() { //objective C function
        
        print("loading!")
        
    }
    
    
    func setupViewController() {
        
        self.view.backgroundColor = .white //UIColor.white (same thing, shortcut)
        self.view.addSubview(entryField)
        self.view.addSubview(entryLabel)
        self.view.addSubview(entryButton)
    }
    
    func setUpLayout() {
        
        entryField.translatesAutoresizingMaskIntoConstraints = false
        entryLabel.translatesAutoresizingMaskIntoConstraints = false
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            entryField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0), //offset from the center
            entryField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200),
            entryField.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.8),
            entryField.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.05),
            
            entryLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            entryLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -270),
            
            entryButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            entryButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100),
            entryButton.widthAnchor.constraint(equalToConstant: self.view.frame.width * 0.5),
            entryButton.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.05)
            ])
        
    }
    
}

