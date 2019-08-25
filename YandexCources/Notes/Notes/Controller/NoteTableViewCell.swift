//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Timofei Sikorski on 8/24/19.
//  Copyright © 2019 SikorskiIT. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        content.text = """
                        long
                        text
                        long
                        text
                        long
                        text
                        """
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
