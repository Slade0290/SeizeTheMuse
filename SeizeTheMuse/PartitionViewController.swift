//
//  PartitionViewController.swift
//  SeizeTheMuse
//
//  Created by Tanguy Ralaimiadana on 04/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class PartitionViewController: UIViewController {
    
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var end: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !end {
            
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        
        AudioKit.output = silence
         do {
         try AudioKit.start()
         }
         catch {
         AKLog("AudioKit did not start !")
         }
         Timer.scheduledTimer(timeInterval: 0.1,
         target: self,
         selector: #selector(PartitionViewController.updateUI),
         userInfo: nil,
         repeats: true)
        }
    }
    
    @objc func updateUI() {
        //let notes: [Note] = [nota, notaa, notaaa]
        //let songPlaying = Song(title: "Tanguy", author: "Tanguy", duration: 20, list: notes)
        
        //chanson avec la liste de note déclarée en début de programme
        
        
        var index = 0 //initialisation de l'élément parcourant la liste de notes
        /*
        while index < songPlaying.listOfNotes.count && !end {//tant que la chanson n'est pas finie
            //labtest.text = "\(index)"
            if tracker.amplitude > 0.2 {//note jouée ou chantée
                
                if (Float(tracker.frequency) <= (songPlaying.listOfNotes[index].frequence + 0.5) &&
                    Float(tracker.frequency) >= (songPlaying.listOfNotes[index].frequence - 0.5))
                    //comparaison note jouée et note attendue
                    //on laisse un intervalle plus large pour les différents accordages
                    //en fonction des instruments
                {
                    index += 1
                }
            }
        }
        */
        end = true
        //call segue
    }
}
