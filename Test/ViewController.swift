//
//  ViewController.swift
//  Test
//
//  Created by Fadie on 28/01/2015.
//  Copyright (c) 2015 Fadie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireSwiftyJSON

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let getJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/geocode/"
    let postJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/offers/"
    var city = ""
    
    var images: [String] = []
    var titles: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getJson(city: String) {
        
        var getJsonURL = getJson+city
        
        Alamofire.request(.GET, getJsonURL).responseJSON {
            (request, response, json, error) in
            if (json != nil) {
                var jsonObj = JSON(json!)
                var latitudeString = jsonObj["latitude"].stringValue
                var longitudeString = jsonObj["longitude"].stringValue
                self.postJson(latitudeString, longitudeString: longitudeString)
            }
        }
    }
    
    func postJson(latitudeString: AnyObject, longitudeString: AnyObject) {
        
        var postJsonURL = postJson+city
        
        var postParameters : [ String : AnyObject] = [
            "latitude": latitudeString,
            "longitude": longitudeString,
            "offset": 0
        ]
        
        Alamofire.request(.POST, postJsonURL, parameters: postParameters, encoding: .JSON).responseJSON {
            (request, response, json, error) -> Void in
            if (json != nil) {
                var jsonObj = JSON(json!)
                
                for (var i = 0; i < 5; ++i) {
                    self.images.append(jsonObj[i]["logoURL"].stringValue)
                    self.titles.append(jsonObj[i]["title"].stringValue)
                }
            self.tableView.reloadData()

            }
        }
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.delegate = self;
        var city = searchBar.text
        self.getJson(city)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
        cell.textLabel!.text = self.titles[indexPath.row]
        
        return cell
    }
    
}