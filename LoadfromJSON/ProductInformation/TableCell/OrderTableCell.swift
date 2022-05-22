//
//  OrderTableCell.swift
//  LoadfromJSON
//
//  Created by Karthick J on 22/05/22.
//

import UIKit

class OrderTableCell: UITableViewCell {

    //@IBOutlets
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
