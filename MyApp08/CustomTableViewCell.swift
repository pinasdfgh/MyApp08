//
//  CustomTableViewCell.swift
//  MyApp08
//
//  Created by user on 2017/6/22.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    
    public func labelText(data:String){
        label1.text = data
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
