//
//  SnippetsViewController.swift
//  Final Project - Snippets
//
//  Created by Amy Liu on 11/16/20.
//

import UIKit

class SnippetsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, passImageBackDelegate, passMusicBack2Delegate, passReminderBack2Delegate, passNoteBack2Delegate {
    
    
    @IBOutlet weak var musicTableView: UITableView!
    @IBOutlet weak var remindersTableView: UITableView!
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var sharedPhoto: UIImageView!
    var photo : UIImage!
    
    var musicData = ["I'll Show You by K/DA", "Dynamite by BTS", "I Lost a Friend by FINNEAS"]
    var remindersData = ["- Do the dishes", "- Fold laundry", "- Get milk and eggs"]
    var notesData = ["11/20 is Dad's Birthday", "Tournament at 7:00pm", "Finals week coming up"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        musicTableView.delegate = self
        musicTableView.dataSource = self
        self.musicTableView.rowHeight = 50.0
//        musicTableView.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")

        
        remindersTableView.delegate = self
        remindersTableView.dataSource = self
        self.remindersTableView.rowHeight = 50.0
//        remindersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "reminderCell")
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        self.notesTableView.rowHeight = 50.0
//        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "noteCell")
        if((self.photo) != nil)
        {
            sharedPhoto.image = photo
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.musicTableView
        {
            count = musicData.count;
        }
        
        if tableView == self.remindersTableView
        {
            count = remindersData.count;
        }
        
        if tableView == self.notesTableView
        {
            count = notesData.count;
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!

        let row = indexPath.row
        
        if tableView == self.musicTableView
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
            var contentConfiguration = cell!.defaultContentConfiguration()
            contentConfiguration.text = musicData[row]
            cell.contentConfiguration = contentConfiguration
            //cell!.textLabel!.text = musicData[row]
        }
        if tableView == self.remindersTableView
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath)
            var contentConfiguration = cell!.defaultContentConfiguration()
            contentConfiguration.text = remindersData[row]
            cell.contentConfiguration = contentConfiguration
            //cell!.textLabel!.text = remindersData[row]
        }
        if tableView == self.notesTableView
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
            var contentConfiguration = cell!.defaultContentConfiguration()
            contentConfiguration.text = notesData[row]
            cell.contentConfiguration = contentConfiguration
            //cell!.textLabel!.text = notesData[row]
        }
        return cell!
    }
    
    //delete rows functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        //if edit is delete on a row
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            //get row
            let row = indexPath.row
            
            //remove row
            if tableView == self.musicTableView
            {
                musicData.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
            if tableView == self.remindersTableView
            {
                remindersData.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
            if tableView == self.notesTableView
            {
                notesData.remove(at: row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
        }
    }

    func passImageBack(image: UIImage!)
    {
        photo = image
        sharedPhoto.image = photo
    }
    
    func passMusicBack2(string: String)
    {
        musicData.append(string)
        musicTableView.reloadData()
    }
    
    func passReminderBack2(reminder: String)
    {
        remindersData.append(reminder)
        remindersTableView.reloadData()
    }
    
    func passNoteBack2(note: String) {
        notesData.append(note)
        notesTableView.reloadData()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "mySegue")
        {
            let choicesViewController = segue.destination as! ChoicesViewController
            choicesViewController.delegate = self
            choicesViewController.delegate2 = self
            choicesViewController.delegateReminder = self
            choicesViewController.delegateNote = self
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
