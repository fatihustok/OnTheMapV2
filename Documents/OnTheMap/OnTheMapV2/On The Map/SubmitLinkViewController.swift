//
//  SubmitLinkViewController.swift
//  
//
//  Created by  Refik Fatih Ustok on 05/04/2015.
//  Copyright (c) 2015  Refik Fatih Ustok. All rights reserved.
//

import UIKit
import WebKit
class SubmitLinkViewController: UIViewController,UISearchBarDelegate {


    @IBOutlet var webView: UIWebView!
    @IBOutlet var searchBar: UISearchBar!
    
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {

        searchBar.resignFirstResponder()
        let text = searchBar.text
        let url = NSURL(string: text!)
        let req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.searchBar.delegate = self
        self.navigationController?.toolbarHidden = false
        
        self.toolbarItems = [UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil),UIBarButtonItem(title: "Submit", style: .Plain, target: self, action: #selector(SubmitLinkViewController.submit)),UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)]

    }
    

    //Submit URL. The URL will be entered in Share Link View
    func submit(){

        self.navigationController?.popViewControllerAnimated(true)
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        if let sl = self.webView.request?.URL!.absoluteString{
            applicationDelegate.shareLink = sl
        }else{
            applicationDelegate.shareLink = "Enter A Link To Share Here"
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.toolbarHidden = true
    }
    
}
