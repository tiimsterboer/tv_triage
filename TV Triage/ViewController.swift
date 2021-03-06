//
//  ViewController.swift
//  TV Triage
//
//  Created by Tim Beemsterboer on 1/20/18.
//  Copyright © 2018 Tim Beemsterboer. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBAction func onSearchEntered(_ sender: Any) {
    }
    @IBOutlet weak var searchResults: UILabel!
    
    
    
    var shows = [TV]()
    
    var searchtext = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  searchtext = SearchField()
       
        let url = URL(string: "https://api.tvmaze.com/shows")
        Alamofire.request(url!).responseJSON { (response) in
            
            let result = response.data
            do {
                self.shows = try JSONDecoder().decode([TV].self, from: result!)
                for show in self.shows {
                    print(show.name,":",show.type,":",show.language)
                    
                }
            }catch {
                print("error")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func webrequest(contentID: String, completion: @escaping ([String]) -> Void) {
        Alamofire.request(
            "http://api.tvmaze.com/search/shows?q=girls"
            )
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(response.result.error)")
                    completion([String]())
                    return
                }
                
                guard let responseJSON = response.result.value as? [String: Any] else {
                    print("Invalid tag information received from the service")
                    completion([String]())
                    return
                }
                
                print(responseJSON)
                completion([String]())
                print("Tim")
        }
    }*/

}

