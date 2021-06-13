//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by 張翔 on 2021/06/14.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    // CheckBox型のButtonとして宣言する
    @IBOutlet var checkBox: CheckBox!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
