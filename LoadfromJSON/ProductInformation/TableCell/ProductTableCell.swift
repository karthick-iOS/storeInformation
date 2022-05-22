//
//  ProductTableCell.swift
//  LoadfromJSON
//  LoadfromJSON
//
//  Created by Karthick J on 22/05/22.
//

import UIKit

class ProductTableCell: UITableViewCell {

    //@IBOutlets
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var counterPlus: UIButton!
    @IBOutlet weak var counterMinus: UIButton!
    @IBOutlet weak var counterLbl: UILabel!
    //@Variables
    var counter = 1
    var onTapOfPlusButton:((_ sender:UIButton) -> Void)?
    var onTapOfMinusButton:((_ sender:UIButton) -> Void)?
    
    //@IBActions
    @IBAction func onTapOfPlusBtn(_ sender: UIButton) {
        if onTapOfPlusButton != nil{
            onTapOfPlusButton?(sender)
        }
    }
    
    @IBAction func onTapOfMinusBtn(_ sender: UIButton) {
        if onTapOfMinusButton != nil{
            onTapOfMinusButton?(sender)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//EXTENSION
extension Float {
    func toString(fractionDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

