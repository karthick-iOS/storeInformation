//
//  DataLoader.swift
//  LoadfromJSON
//
//  Created by Karthick J on 22/05/22.
//

import Foundation

//Get the details from mock JSON

public class DataLoader {
    
    @Published var userData = [UserData]()
    
    init() {
        load()
        sort()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    //Sorting values
    func sort() {
        self.userData = self.userData.sorted(by: { $0.product_id < $1.product_id })
    }
}
