//
//  TableViewCell.swift
//  emailApp
//
//  Created by Bhumit Muchhadia on 2020-01-31.
//  Copyright © 2020 Bhumit Muchhadia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var archBtn: UIButton!
      @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
