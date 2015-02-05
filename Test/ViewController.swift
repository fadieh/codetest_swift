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

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var tableView:UITableView!
    
    let getJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/geocode/"
    let postJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/offers/"
    var city = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func searchBar(searchBar: UISearchBar,
        textDidChange searchText: String) {
    
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
            println(json!)
        }
        
        
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.delegate = self;
        var city = searchBar.text
        self.getJson(city)
    }
    
}