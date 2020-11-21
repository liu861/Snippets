//
//  NoteViewController.swift
//  Final Project - Snippets
//
//  Created by Amy Liu on 11/17/20.
//

import UIKit

protocol passNoteBackDelegate: class
{
    func passNoteBack(note: String)
}

class NoteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var shareNote: UIButton!
    @IBOutlet weak var noteText: UITextField!
    weak var delegate: passNoteBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        noteText.delegate = self
        shareNote.isEnabled = false
    }
    

    @IBAction func shareNotePressed(_ sender: Any)
    {
        let note = noteText.text!
        delegate?.passNoteBack(note: note)
        noteText.text!.removeAll()
        shareNote.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if(noteText.text!.count >= 1)
        {
            shareNote.isEnabled = true
        }
        else
        {
            shareNote.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //close keyboard
        textField.resignFirstResponder()
        //return
        return true
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
