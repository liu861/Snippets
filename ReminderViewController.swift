//
//  ReminderViewController.swift
//  Final Project - Snippets
//
//  Created by Amy Liu on 11/17/20.
//

import UIKit

protocol passReminderBackDelegate : class
{
    func passReminderBack(reminder: String)
}

class ReminderViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var shareReminder: UIButton!
    @IBOutlet weak var reminderText: UITextField!
    weak var delegate: passReminderBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reminderText.delegate = self
        shareReminder.isEnabled = false
    }
    

    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if(reminderText.text!.count >= 1)
        {
            shareReminder.isEnabled = true
        }
        else
        {
            shareReminder.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //close keyboard
        textField.resignFirstResponder()
        //return
        return true
    }
    @IBAction func shareReminderPressed(_ sender: Any)
    {
        let reminder = reminderText.text!
        delegate?.passReminderBack(reminder: reminder)
        reminderText.text?.removeAll()
        shareReminder.isEnabled = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
