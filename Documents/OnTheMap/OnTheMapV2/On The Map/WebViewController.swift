//
//  WebViewController.swift
//  On The Map
//  Created by  Refik Fatih Ustok on 03/04/2015.
//  Copyright (c) 2015  Refik Fatih Ustok. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    
    var url:NSURL? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let site = url{
            let request = NSURLRequest(URL:site)
            self.webView!.loadRequest(request)
        }
    }
}
