//
//  ViewController.swift
//  TravisDemo
//
//  Created by Xueliang Zhu on 1/26/16.
//  Copyright © 2016 Xueliang Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    var validationService: PValidationService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationService = SimpleValidationService()
    }
    
    @IBAction func doLogin(sender: AnyObject) {
        
        let userNameResult = validationService.userNameValidate(userNameTextField.text!)
        if userNameResult != .NoError {
            showAlertViewWithMessage(userNameResult.rawValue)
            return
        }
        
        let passwordResult = validationService.passwordValidate(passwordTextField.text!)
        if passwordResult != .NoError  {
            showAlertViewWithMessage(passwordResult.rawValue)
            return
        }
        
        showAlertViewWithMessage("Success")
    }
    
    private func showAlertViewWithMessage(msg: String) {
        let alert = UIAlertController(title: "Result", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

