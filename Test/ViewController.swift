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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func searchBar(searchBar: UISearchBar,
        textDidChange searchText: String) {
            
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.delegate = self;
        
        var city = searchBar.text
        var getJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/geocode/"
        var postJson = "http://ec2-54-69-64-196.us-west-2.compute.amazonaws.com:3000/offers/"
        var getJsonURL = getJson+city
        var postJsonURL = postJson+city
        
        Alamofire.request(.GET, getJsonURL).responseJSON {
            (request, response, JSON, error) in
            println(JSON)
        }
        
//        Alamofire.request(.POST, postJsonURL).responseJSON {
//            (request, response, JSON, error) in
//            println(response)
//        }
        
        
    }

}

