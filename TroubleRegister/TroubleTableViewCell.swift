//
//  TroubleTableViewCell.swift
//  TroubleRegister
//
//  Created by Alexandre Silva on 25/07/22.
//  Copyright © 2022 AlexDiegoS. All rights reserved.
//

import UIKit

class TroubleTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewTrouble: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWith(_ trouble: Trouble){
        labelName.text = trouble.name
        labelDate.text = trouble.date
        
        if let image = trouble.image {
            imageViewTrouble.image = UIImage(data: image)
        } else {
            imageViewTrouble.image = UIImage(named: "background")
        }
    }
}
