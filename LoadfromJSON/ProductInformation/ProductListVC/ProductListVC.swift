//
//  DataTableViewController.swift
//  LoadfromJSON
//
//  Created by Karthick J on 22/05/22.

import UIKit

class ProductListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //@IBOutlets
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var orderDetailTableView: UITableView!
    
    //@Variables
    //Selected products
    var productName = [String]()
    var productPrice = [String]()
    var productImage = [String]()
    var valueCounter = 0
    
    //MockJson - Data
    let data = DataLoader().userData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartView.isHidden = true
    }
    
    //@IBActions
    @IBAction func summaryButton(_ sender: UIButton){
        cartView.isHidden = false
        orderDetailTableView.reloadData()
    }
    
    @IBAction func closeButton(_ sender: UIButton){
        cartView.isHidden = true
    }
    
    // MARK: - Table view data source
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if(tableView == productTableView){
             return data.count
         }
         if(tableView == orderDetailTableView){
             return productName.count
         }
         return 0
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         if(tableView == productTableView){
             let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableCell") as! ProductTableCell
             cell.productName.text = data[indexPath.row].product_name
             cell.productDesc.text = data[indexPath.row].product_desc
             cell.productImage.image = UIImage(named: data[indexPath.row].product_image)
             
             if(cell.counterPlus.tag == 0){
                 cell.productPrice.text = String (data[indexPath.row].product_price)
             }
             
             cell.onTapOfPlusButton = { (sender)  in
                 cell.counterPlus.tag = 1
                 if(cell.counter < 1){}else{
                 cell.counter = cell.counter + 1
                 self.valueCounter = cell.counter
                 cell.counterLbl.text = String (cell.counter)
                 let price = self.data[indexPath.row].product_price
                 cell.productPrice.text = String (price * cell.counter)
                 }
             }
             cell.onTapOfMinusButton = { (sender)  in
                 if(cell.counter == 1){
                     
                 }else{
                     cell.counter = cell.counter - 1
                     self.valueCounter = cell.counter
                     cell.counterLbl.text = String (cell.counter)
                     let price = self.data[indexPath.row].product_price
                     cell.productPrice.text = String (price * cell.counter)
                 }
                 
             }
             return cell
         }
         if(tableView == orderDetailTableView){
             
             let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableCell") as! OrderTableCell
             cell.productName.text = productName[indexPath.row]
             cell.productImage.image = UIImage(named: productImage[indexPath.row])
             cell.productPrice.text = productPrice[indexPath.row]
             return cell
         }
         
         return UITableViewCell()
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if(tableView == productTableView){
             return 177
         }
         
         if(tableView == orderDetailTableView){
             return 100
         }
         return 0
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if(tableView == productTableView){
             //Multiple selections
             tableView.allowsMultipleSelection = true
             
             let myCell = tableView.cellForRow(at: indexPath) as? ProductTableCell
             myCell?.accessoryType = .checkmark
             productName.append(data[indexPath.row].product_name)
             productPrice.append(String (data[indexPath.row].product_price))
             productImage.append(data[indexPath.row].product_image)
         }
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let myCell = tableView.cellForRow(at: indexPath) as? ProductTableCell
        myCell?.accessoryType = .none
         if(tableView == productTableView){
             //ProductName
             if let index = productName.firstIndex(of: data[indexPath.row].product_name) {
                 productName.remove(at: index)
                 print(productName)
             }
             //Product price
             if let index = productPrice.firstIndex(of: String (data[indexPath.row].product_price)) {
                 productPrice.remove(at: index)
                 print(productPrice)
             }
             //Product image
             if let index = productImage.firstIndex(of: data[indexPath.row].product_image) {
                 productImage.remove(at: index)
                 print(productImage)
             }
         }
    }
}
