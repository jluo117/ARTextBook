//
//  ViewController.swift
//  myTextbooksAR
//
//  Created by Iccha Singh on 9/6/19.
//  Copyright © 2019 Iccha Singh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SwiftyJSON
var myAry = [String]()
class EnterClassCodeScreen: UIViewController, UITextFieldDelegate {
    var curClassCode = ""
    //var myAry = [String] ()
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
        //loadTextbooks()
    }
    
    lazy var entryLabel: UITextField = {
        let label = UITextField(frame: .zero)
        label.text = "Welcome"
        
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
        
        LoadFunction()
        
    }
    
    
    func setupViewController() {
        
        self.view.backgroundColor = .white //UIColor.white (same thing, shortcut)
        self.view.addSubview(entryField)
        self.view.addSubview(entryLabel)
        self.view.addSubview(entryButton)
        entryField.delegate = self
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        entryField.becomeFirstResponder()
        entryField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        entryField.resignFirstResponder()
        self.curClassCode = entryField.text ?? ""
        return true
        
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
    func LoadFunction(){
        let ref = Database.database().reference()
        let myData = ref.child(self.curClassCode)
        let myGroup = DispatchGroup()
        self.myAry = []
        var valid = false
        myGroup.enter()
        myData.observeSingleEvent(of: .value, with: {
            (snapshot) in
            let myValue = JSON(snapshot.value as Any)
            if myValue == JSON.null{
                let alertController = UIAlertController(title: "Invalid Class ID", message:
                    "Enter a Valid Class Code", preferredStyle: .alert)
                let action = UIAlertAction(title: "Exit", style: .cancel)
                action.setValue(UIColor.init(named: "black"), forKey: "titleTextColor")
                alertController.addAction(action)
                valid = false
                
                //alertController.view.backgroundColor = UIColor.init(named: "Blue")
                self.present(alertController, animated: false, completion: nil)
                
                
            }
            else{
                valid = true
            }
            let myDataAry = myValue.arrayValue
            for myData in myDataAry{
                let myBook = myData["Name"].string
                if (myBook != nil){
                    myAry.append(myBook!)
                }
                
            }
            
            print(myAry)
            myGroup.leave()
        })
        myGroup.notify(queue: .main){
            if valid{
                print("next screen")
            }
            else{
                print("wait here")
            }
        }
    }
    
}

