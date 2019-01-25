//
//  ViewController.swift
//  countryInfoJSON
//
//  Created by West Kraemer on 1/25/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        struct NameCapital: Decodable {
            var name: String?
            var capital: String?
            var region: String?
        }
        
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all?fields=name;capital;currencies") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            do {
                let jsonDescription = try JSONDecoder().decode([NameCapital].self, from: data)
//                for i in jsonDescription {
//                    print(i.name)
//                    print(i.capital)
//                    print(i.region)
//                }
                print(jsonDescription[0].capital)
                
                
                //print(jsonDescription)
            }
            catch let jsonError {
                print("Json Error:", jsonError)
            }
        }.resume()
        
        
    }
}

