//
//  ViewController.swift
//  TPiOS
//
//  Created by Moi on 23/03/2016.
//  Copyright © 2016 frodriguez.fr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var data: [(name: String, id: Int)] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // charger les données json
        let json = NSDataAsset(name: "data.json", bundle: NSBundle.mainBundle())
        
        do {
            let dataJson = try NSJSONSerialization.JSONObjectWithData(json!.data, options: NSJSONReadingOptions.AllowFragments)
            if let list = dataJson["User"] as? [[String: AnyObject]] {
                for item in list {
                    var name: String?
                    var id: Int?
                    if let nameAux = item["Name"] as? String {
                        name = nameAux
                    }
                    else {
                        name = "Unknown"
                    }
                    if let idAux = item["ID"] as? Int {
                        id = idAux
                    }
                    else {
                        id = -1
                    }

                    data.append((name: name!, id: id!))
                }
            }
        } catch {
            print("Erreur lecture json: \(error)")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    // nombre de lignes dans la tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // contenu de chaque ligne
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        cell.textLabel?.text = String(data[indexPath.row].id) + " - " + data[indexPath.row].name

        return cell
    }
    
    
    // clic sur une ligne
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("segueHomeToResult", sender: indexPath)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueHomeToResult" {
            let nextView = segue.destinationViewController as! ResultViewController
            let indexPath = sender as! NSIndexPath

            nextView.name = data[indexPath.row].name
            nextView.id = data[indexPath.row].id
        }
    }


}

