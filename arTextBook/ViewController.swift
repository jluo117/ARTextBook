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
class ViewController: UIViewController {
    var myClassCode = "123"
    var myAry = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var EnteredCode: UITextField!
    
    
   
    func textFieldShouldReturn(_ EnteredCode: UITextField) -> Bool {
        myClassCode = EnteredCode.text ?? ""
        print()
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func LoadDataBase(_ sender: UIButton) {
        let ref = Database.database().reference()
        let myData = ref.child(myClassCode)
        myData.observeSingleEvent(of: .value, with: {
            (snapshot) in
            let myValue = JSON(snapshot.value as Any)
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

