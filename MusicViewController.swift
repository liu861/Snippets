//
//  MusicViewController.swift
//  Final Project - Snippets
//
//  Created by Amy Liu on 11/17/20.
//

import UIKit

protocol passMusicBackDelegate: class
{
    func passMusicBack(song: String, artist: String)
}

class MusicViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var songName: UITextField!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var shareSong: UIButton!
    weak var delegate : passMusicBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        songName.delegate = self
        artistName.delegate = self
        shareSong.isEnabled = false
    }
    
    @IBAction func shareSongPressed(_ sender: Any)
    {
        let song: String = songName.text!
        let artist: String = artistName.text!
        delegate?.passMusicBack(song: song, artist: artist)
        songName.text?.removeAll()
        artistName.text?.removeAll()
        shareSong.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if(songName.text!.count >= 1 && artistName.text!.count >= 1)
        {
            shareSong.isEnabled = true
        }
        else
        {
            shareSong.isEnabled = false
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
