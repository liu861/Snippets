//
//  ChoicesViewController.swift
//  Final Project - Snippets
//
//  Created by Amy Liu on 11/16/20.
//

import UIKit

protocol passImageBackDelegate: class
{
    func passImageBack(image: UIImage!)
}

protocol passMusicBack2Delegate: class
{
    func passMusicBack2(string: String)
}

protocol passReminderBack2Delegate: class
{
    func passReminderBack2(reminder: String)
}

protocol passNoteBack2Delegate: class
{
    func passNoteBack2(note: String)
}
class ChoicesViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, passMusicBackDelegate, passReminderBackDelegate, passNoteBackDelegate {
    
    
    //list of commands for snippets
    
    @IBOutlet weak var sharePhoto: UIButton!
    weak var delegate: passImageBackDelegate?
    weak var delegate2: passMusicBack2Delegate?
    weak var delegateReminder: passReminderBack2Delegate?
    weak var delegateNote: passNoteBack2Delegate?
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func shareImageFunc(_ sender: Any)
    {
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
    
        let chosenImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                
        delegate?.passImageBack(image: chosenImage)

        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true)
    }
    
    func passMusicBack(song: String, artist: String)
    {
        let song = song
        let artist = artist
        let music = song + " by " + artist
        delegate2?.passMusicBack2(string: music)
    }
    
    func passReminderBack(reminder: String)
    {
        let reminder = reminder
        delegateReminder?.passReminderBack2(reminder: reminder)
    }
    
    func passNoteBack(note: String) {
        let note = note
        delegateNote?.passNoteBack2(note: note)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "musicSegue")
        {
            let musicVC = segue.destination as! MusicViewController;
            musicVC.delegate = self
        }
        if(segue.identifier == "reminderSegue")
        {
            let reminderVC = segue.destination as! ReminderViewController
            reminderVC.delegate = self
        }
        if(segue.identifier == "noteSegue")
        {
            let noteVC = segue.destination as! NoteViewController
            noteVC.delegate = self
        }
    }
}
