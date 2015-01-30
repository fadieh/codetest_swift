//
//  ViewController.swift
//  Test
//
//  Created by Fadie on 28/01/2015.
//  Copyright (c) 2015 Fadie. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UISearchBarDelegate {
    
    let getJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/geocode/"
    let postJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/offers/"
    var city = ""
    var latitudeString = ""
    var longitudeString = ""
    var postParameters = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func searchBar(searchBar: UISearchBar,
        textDidChange searchText: String) {
            
    }
    
    func getJsonFromServer(city: String) {
        var getJsonURL = getJson+city
        
        Alamofire.request(.GET, getJsonURL).responseJSON {
            (request, response, jsonData, error) in
            if error != nil {
                println(error)
            } else if let json = jsonData as? [String:AnyObject] {
                println(json)
                println(jsonData)
                self.processJsonData(json)
            } else {
                println("Failed to cast JSON to [String:AnyObject]")
            }
        }
    }
    
    func processJsonData(json: [String:AnyObject]) {
        if let str = json["longitude"] as? String {
            latitudeString = str
            println(latitudeString)
        }
    }
    
    func postJsonToServer() {
        var postJsonURL = postJson+city
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.delegate = self;
        var city = searchBar.text
        self.getJsonFromServer(city)
    }
}