//
//  BookCollectionViewCell.swift
//  arTextBook
//
//  Created by james luo on 9/7/19.
//  Copyright © 2019 james luo. All rights reserved.
//

import UIKit
var Current = "test"
class BookCollectionViewCell: UICollectionViewCell {
    @IBAction func toAR(_ sender: UIButton) {
        Current = BookName.currentTitle!
        print(Current)
    }
    
    @IBOutlet weak var BookName: UIButton!
}
