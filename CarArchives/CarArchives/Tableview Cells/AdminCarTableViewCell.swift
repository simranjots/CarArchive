//
//  AdminCarTableViewCell.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-29.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit

class AdminCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var uImg: UIImageView!
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var uYear: UILabel!
    @IBOutlet weak var uPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         uImg.makeRounded()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

