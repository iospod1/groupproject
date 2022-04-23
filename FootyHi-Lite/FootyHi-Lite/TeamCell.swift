//
//  TeamCell.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit

class TeamCell: UITableViewCell {
    
    // Labels
    // ImageView
    
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamPoints: UILabel!
    @IBOutlet weak var gamePlayed: UILabel!
    
    @IBOutlet weak var P: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
