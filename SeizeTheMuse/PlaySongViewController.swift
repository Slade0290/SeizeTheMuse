//
//  PlaySongViewController.swift
//  SeizeTheMuse
//
//  Created by Tanguy Ralaimiadana on 26/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class PlaySongViewController : UIViewController {
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    
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
}
