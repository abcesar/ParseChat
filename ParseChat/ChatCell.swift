//
//  ChatCell.swift
//  ParseChat
//
//  Created by Cesar Gutierrez on 10/1/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    @IBOutlet weak var chatMessageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
