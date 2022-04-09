//
//  BetCell.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit

class BetCell: UITableViewCell {
    
    @IBOutlet weak var topWinners: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
