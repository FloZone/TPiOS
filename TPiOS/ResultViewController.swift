//
//  ResultViewController.swift
//  TPiOS
//
//  Created by Moi on 24/03/2016.
//  Copyright © 2016 frodriguez.fr. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var name: String!
    var id: Int!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
