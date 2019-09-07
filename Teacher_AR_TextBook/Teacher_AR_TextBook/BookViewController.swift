//
//  BookViewController.swift
//  Teacher_AR_TextBook
//
//  Created by james luo on 9/7/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var BookName: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var Level: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let targetBook = myBooks[curChoice]
        Image.image = UIImage(named: targetBook.Image)
        self.Genre.text = targetBook.Genre
        self.BookName.text = targetBook.BookName
        self.Level.text = String(targetBook.Level)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addToCart(_ sender: Any) {
        if mySet.contains(myBooks[curChoice].BookName) {
            let alertController = UIAlertController(title: "Duplicate Book", message:
                "This Book is already in your Cart", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            mySet.insert(myBooks[curChoice].BookName)
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
