//
//  BetCell.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit

class BetCell: UITableViewCell {
    
    @IBOutlet weak var homeLogo: UIImageView!
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var awayLogo: UIImageView!
    @IBOutlet weak var awayTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
