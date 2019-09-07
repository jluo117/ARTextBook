//
//  ViewController.swift
//  Teacher_AR_TextBook
//
//  Created by james luo on 9/7/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import SwiftyJSON
var curClassID = ""
class ViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var ClassID: UITextField!
    var isValid = false
    var myThreads = DispatchGroup()
    override func viewDidLoad() {
        ClassID.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ClassID.text = ""
        ClassID.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        curClassID = ClassID.text ?? ""
        ClassID.resignFirstResponder()
        return true
    }
    func checkValid(){
        self.myThreads.enter()
        let ref = Database.database().reference()
        let myData = ref.child(curClassID)
        myData.observeSingleEvent(of: .value, with: {
            (snapshot) in
            let myValue = JSON(snapshot.value as Any)
            if myValue == JSON.null{
                self.isValid = false
            }
            else{
                self.isValid = true
            }
            self.myThreads.leave()
        })
        
    }
    @IBAction func Signin(_ sender: Any) {
        checkValid()
        self.myThreads.notify(queue: .main){
            if self.isValid{
                self.performSegue(withIdentifier: "toBooks", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Invalid Class ID", message:
                    "Enter a Valid Class Code or press sign up", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    @IBAction func SignUp(_ sender: Any) {
        let ref = Database.database().reference()
        curClassID = ref.childByAutoId().key ?? ""
        self.ClassID.text = curClassID
        let newData = [
            "0":[
                "Name": "Sample"
            ]
            
        ]
        ref.child(curClassID).setValue(newData)
    }
}

