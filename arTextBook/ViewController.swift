//
//  ViewController.swift
//  arTextBook
//
//  Created by james luo on 9/6/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftyJSON
class ViewController: UIViewController, UITextFieldDelegate {
    var myClassCode = "123"
    var myAry = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EnteredCode.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var EnteredCode: UITextField!
    
    
   
    
    @IBAction func TextAction(_ sender: UITextField) {
        EnteredCode.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        EnteredCode.resignFirstResponder()
        myClassCode = EnteredCode.text ?? ""
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        EnteredCode.text = ""
    }
    
    @IBAction func LoadDataBase(_ sender: UIButton) {
        LoadFunction()
    }
    func LoadFunction(){
        let ref = Database.database().reference()
        let myData = ref.child(myClassCode)
        self.myAry = []
        myData.observeSingleEvent(of: .value, with: {
            (snapshot) in
            let myValue = JSON(snapshot.value as Any)
            if myValue == JSON.null{
                let alertController = UIAlertController(title: "Invalid Class ID", message:
                    "Enter a Valid Class Code", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            let myDataAry = myValue.arrayValue
            for myData in myDataAry{
                let myBook = myData["Name"].string
                if (myBook != nil){
                    self.myAry.append(myBook!)
                }
                
            }
            
            print(self.myAry)
            
        })
    }
}

