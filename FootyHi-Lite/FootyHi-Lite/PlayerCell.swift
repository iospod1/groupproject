//
//  PlayerCell.swift
//  FootyHi-Lite
//
//  Created by Nick on 2022-04-09.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var goals: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
