//
//  AnimalCell.swift
//  AnimalPlanet
//
//  Created by Apple on 3/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AVFoundation
class AnimalCell: UITableViewCell ,AVAudioPlayerDelegate{
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDesc: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
