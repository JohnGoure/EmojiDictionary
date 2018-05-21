//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by john goure on 5/21/18.
//  Copyright © 2018 john goure. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
        Emoji("😀", "Grinning Face", "A typical smiley face.", "happiness"),
        Emoji("😕", "Confused Face", "A confused, puzzled face.", "unsure what to think; displeasure"),
        Emoji("😍", "Heart Eyes", "A smiley face with hearts for eyes.", "love of something; attractive"),
        Emoji("👮", "Police Officer", "A police officer wearing a blue cap with a gold badge.", "person of authority"),
        Emoji("🐢", "Turtle", "A cute turtle.", "Something slow"),
        Emoji("🐘", "Elephant", "A cute turtle.", "good memory"),
        Emoji("🍝", "Spaghetti", "A plate of spaghetti.", "spaghetti"),
        Emoji("🎲", "Die", "A single die.", "taking a risk, change; game"),
        Emoji("⛺️", "Tent", "A small tent.", "camping"),
        Emoji("📚", "Stack of Books", "Three colored books stacked on each other.", "homework, studying"),
        Emoji("💔", "Broken Heart", "A red, broken heart.", "extreme"),
        Emoji("💤", "Snore", "Three blue \'z\'s", "tired, sleepiness"),
        Emoji("🏁", "Checkered Flag", "A black-and-white checkered flag.", "completion")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)

        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(emojis[indexPath.row].symbol) \(indexPath)")
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(moveEmoji, at: to.row)
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
