//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by avi on 09/03/15.
//  Copyright (c) 2015 avi. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    // create an audio engine
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudioWithVaribleSpeed(0.5)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        playAudioWithVaribleSpeed(1.5)
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariblePitch(1000)
    }
    
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariblePitch(-1000)
    }
    
    func playAudioWithVaribleSpeed(speed: Float) {
        audioPlayer.stop()
        audioPlayer.rate = speed
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    func playAudioWithVariblePitch(pitch: Float) {
        // stop all playing audio
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    
    @IBAction func stopAudioPlayback(sender: UIButton) {
        audioPlayer.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let filePathURL = receivedAudio.filePathUrl {
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathURL, error: nil)
            // required if you want to change the rate of playback
            audioPlayer.enableRate = true
            
            // intiliaze the AVAudioFile
            audioFile = AVAudioFile(forReading: filePathURL, error: nil)
        }
        // initiliaze the engine
        audioEngine = AVAudioEngine()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
