//
//  UserData.swift
//  LoadfromJSON
//
//  Created by Karthick J on 22/05/22.
//

import Foundation

//Product Model
struct UserData: Codable {
    
    var product_id: Int
    var product_name: String
    var product_type: String
    var product_desc: String
    var product_image: String
    var product_price: Int
}
