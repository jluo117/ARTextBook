//
//  TextBookTableViewCell.swift
//  
//
//  Created by james luo on 9/7/19.
//

import UIKit

class TextBookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
