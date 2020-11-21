//
//  ViewController.swift
//  Final Project - Snippets
//
//  Created by Amy Liu on 11/11/20.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        email.delegate = self
        password.delegate = self
        signin.isEnabled = false
    }
    
    //enable sign in button only if email contains @ and password count is >= 8 characters
    func textFieldDidEndEditing(_ textField: UITextField) {
        if((email.text?.contains("@")) != nil && password.text!.count >= 8)
        {
            signin.isEnabled = true
        }
        else
        {
            signin.isEnabled = false
        }
    }
    
    //close keyboard when pressing return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //close keyboard
        textField.resignFirstResponder()
        //return
        return true
    }
    
    @IBAction func myUnwindAction(segue: UIStoryboardSegue)
    {
        
    }
}

