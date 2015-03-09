//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by avi on 09/03/15.
//  Copyright (c) 2015 avi. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    
    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBAction func recordAudio(sender: UIButton) {
        recordingInProgress.hidden = false
        stopButton.hidden = false
        recordButton.enabled = false
    }
    
    @IBAction func stopAudioRecording(sender: UIButton) {
        recordingInProgress.hidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        
        // this required here only, instead of stopAudioRecording, since 
        // once we press stop, it will be segued to another MVC. And when we 
        // come back, we better have this button enabled again
        recordButton.enabled = true
    }

}

