//
//  PlaySongViewController.swift
//  SeizeTheMuse
//
//  Created by Tanguy Ralaimiadana on 26/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

/*import UIKit
import AudioKit
import AudioKitUI

class PlaySongViewController : UIViewController {
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var songPlaying: Song!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AudioKit.output = silence
        do {
            try AudioKit.start()
        }
        catch {
            AKLog("AudioKit did not start !")
        }
    }
    @objc func updateUI() {
        let nota = Note(name: "La", frequence: 110.00, altered: false)
        let notaa = Note(name: "Do", frequence: 65.41, altered: false)
        let notaaa = Note(name: "Re", frequence: 73.42, altered: false)
        songPlaying.listOfNotes = [nota, notaa, notaaa]
        if tracker.amplitude > 0.1 {
            var i: Int = 0
            while i < songPlaying.listOfNotes.count {
                var frequency = Double(tracker.frequency)
                if frequency == songPlaying.listOfNotes[i].frequence {
                    print(songPlaying.listOfNotes[i].name)
                    i += 1
                }
                else
                {
                    print("noob")
                }
            }
        }
    }
}*/
