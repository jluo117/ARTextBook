//
//  BookStoreViewController.swift
//  Teacher_AR_TextBook
//
//  Created by james luo on 9/7/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import UIKit
import FirebaseDatabase
var curChoice = 0
var mySet = Set<String>()
class BookStoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PushToClass(_ sender: Any) {
        let ref = Database.database().reference()
        ref.child(curClassID).setValue(buildDataBase())
        mySet = []
    }
    func buildDataBase() -> [[String: Any]]{
        var FirebaseAry = [[String: Any]] ()
        for myValues in mySet{
            let toAppend = [
                "Name": myValues
            ]
            FirebaseAry.append(toAppend)
        }
        return FirebaseAry
    }
    
    
    @IBAction func LogOut(_ sender: Any) {
        curClassID = ""
    }
    @IBAction func sciencBook(_ sender: Any) {
        curChoice = 0
        self.performSegue(withIdentifier: "bookinfo", sender: self)
    }
    
    @IBAction func csBook(_ sender: Any) {
        curChoice = 1
        self.performSegue(withIdentifier: "bookinfo", sender: self)
    }
    
    @IBAction func math(_ sender: Any) {
        curChoice = 2
        self.performSegue(withIdentifier: "bookinfo", sender: self)
    }
    
    @IBAction func history(_ sender: Any) {
        curChoice = 3
        self.performSegue(withIdentifier: "bookinfo", sender: self)
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
