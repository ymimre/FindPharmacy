//
//  PharmacyListTableViewCell.swift
//  FindPharmacy
//
//  Created by user229720 on 24.11.2022.
//

import UIKit

class PharmacyListTableViewCell: UITableViewCell {

    @IBOutlet weak var pharmacyNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
