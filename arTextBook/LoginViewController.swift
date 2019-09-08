//
//  LoginViewController.swift
//  arTextBook
//
//  Created by james luo on 9/7/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SwiftyJSON
var userBooks = [String]()
class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var UserLogin: UITextField!
    
    override func viewDidLoad() {
        self.UserLogin.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender: UIButton) {
        LoadFunction()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        textField.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func LoadFunction(){
        let curClassCode = UserLogin.text ?? ""
        userBooks = []
        if curClassCode == ""{
            let alertController = UIAlertController(title: "Invalid Class ID", message:
                "Enter a Valid Class Code", preferredStyle: .alert)
            let action = UIAlertAction(title: "Exit", style: .cancel)
            action.setValue(UIColor.black, forKey: "titleTextColor")
            alertController.addAction(action)
            return
        }
        
        let ref = Database.database().reference()
        let myData = ref.child(curClassCode)
        let myGroup = DispatchGroup()
        
        var valid = false
        myGroup.enter()
        myData.observeSingleEvent(of: .value, with: {
            (snapshot) in
            let myValue = JSON(snapshot.value as Any)
            if myValue == JSON.null{
                let alertController = UIAlertController(title: "Invalid Class ID", message:
                    "Enter a Valid Class Code", preferredStyle: .alert)
                let action = UIAlertAction(title: "Exit", style: .cancel)
                action.setValue(UIColor.black, forKey: "titleTextColor")
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
                    userBooks.append(myBook!)
                }
            }
            
            print(userBooks)
            myGroup.leave()
        })
        myGroup.notify(queue: .main){
            if valid{
                self.performSegue(withIdentifier: "toCollection", sender: self)
            }
            else{
                print("wait here")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
