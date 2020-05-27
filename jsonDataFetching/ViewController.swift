//
//  ViewController.swift
//  jsonDataFetching
//
//  Created by Xelpmoc Mac on 27/05/20.
//  Copyright © 2020 Xelpmoc Mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import  SDWebImage



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    
    
    @IBOutlet weak var userDetailTable: UITableView!
    
   
    
    private var useringurl: [String] = []
    private var name: [String] = []
    private var age: [String] = []
    private var location: [String] = []
    private var numberOfItems: Int = 0
    private var responseJSON: JSON  = []
   
    
    let url = URL(string: "https://demo8716682.mockable.io/cardData")
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callJsonData()
        
        userDetailTable.rowHeight = 200.0
        userDetailTable.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "UserDetailTableViewCell")
    }
        
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
      }
      
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userDetailTable.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell", for: indexPath) as!UserDetailTableViewCell
       
        
        cell.userimg?.sd_setImage(with: URL( string:useringurl[indexPath.row]), completed: nil)
        
        cell.username.text = self.name[indexPath.row]
        cell.userage.text = self.age[indexPath.row]
        cell.userlocation.text = self.location[indexPath.row]
        
      return cell
      }
      
    
    
    
    
    func callJsonData(){
                Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { (response) in
                    if response.result.isSuccess {
                     
                        print(response)
                          
                        self.responseJSON = JSON(response.result.value!)
                        
                         self.numberOfItems = self.responseJSON.count
                        for i in 0..<self.numberOfItems {
                                                 
                            self.useringurl.append(self.responseJSON[i]["url"].stringValue)
                            self.name.append(self.responseJSON[i]["name"].stringValue)
                            self.age.append(self.responseJSON[i]["age"].stringValue)
                            self.location.append(self.responseJSON[i]["location"].stringValue)
                                              }
                        self.userDetailTable.reloadData()
                        print(self.useringurl)
                        print(self.name)
                        print(self.age)
                        print(self.location)
                }
                    else{
                        print("Error\(String(describing: response.result.error))")
                        }

            }
            
        }


}
