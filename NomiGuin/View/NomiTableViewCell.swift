//
//  NomiTableViewCell.swift
//  NomiGuin
//
//  Created by 中嶋裕也 on 2020/09/25.
//

import UIKit

class NomiTableViewCell: UITableViewCell {
    
    @IBOutlet var userNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
