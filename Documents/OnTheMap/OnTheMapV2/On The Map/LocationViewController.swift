//
//  LocationViewController.swift
//  test
//
//  Created by  Refik Fatih Ustok on 04/04/2015.
//  Copyright (c) 2015 S Refik Fatih Ustok. All rights reserved.
//

import UIKit
import MapKit
class LocationViewController: UIViewController {
    var tapRecognizer: UITapGestureRecognizer? = nil


    @IBOutlet var button: UIButton!
    @IBOutlet weak var locationString: UITextField! // The String location for geocoding
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var update = false // Indicates whether the update/save location button will update or create a new entry to in the student's API
    override func viewDidLoad() {
        super.viewDidLoad()

        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = UIColor.whiteColor()
        button.alpha = 0.8
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(LocationViewController.cancel))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGrayColor()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.toolbar.hidden = true
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(LocationViewController.handleSingleTap(_:)))
        tapRecognizer?.numberOfTapsRequired = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.removeKeyboardDismissRecognizer()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.addKeyboardDismissRecognizer()
    }
    
    // MARK: - Keyboard Fixes
    
    func addKeyboardDismissRecognizer() {
        self.view.addGestureRecognizer(tapRecognizer!)
    }
    
    func removeKeyboardDismissRecognizer() {
        self.view.removeGestureRecognizer(tapRecognizer!)
    }
    
    //Action to dismiss the keyboard when a tap was performed outside the text view
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    //MARK: -
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = segue.identifier {
            let detailController = segue.destinationViewController as! ShareViewController
            detailController.locationString = locationString.text
        }
    }
    //MARK: - Button Action
    func cancel(){
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

