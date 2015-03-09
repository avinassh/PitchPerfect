//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by avi on 09/03/15.
//  Copyright (c) 2015 avi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBAction func recordAudio(sender: UIButton) {
        recordingInProgress.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

