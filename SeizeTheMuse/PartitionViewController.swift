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
    
    let nota = Note(name: "La", frequence: 110.00, altered: false)
    let notaa = Note(name: "Do", frequence: 130.81, altered: false)
    let notaaa = Note(name: "Re", frequence: 146.83, altered: false)
    //   let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
    
    /*    override func viewWillDisappear(_ animated : Bool) {
     super.viewWillDisappear(animated)
     UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
     }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*AKSettings.audioInputEnabled = true
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
                             repeats: true)*/
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
         Timer.scheduledTimer(timeInterval: 0.1,
         target: self,
         selector: #selector(PartitionViewController.updateUI),
         userInfo: nil,
         repeats: true)
        
    }
    @objc func updateUI() {
        let notes: [Note] = [nota, notaa, notaaa]
        let songPlaying = Song(title: "Tanguy", author: "Tanguy", duration: 20, list: notes)
        //chanson avec la liste de note déclarée en début de programme
        
        
        var index = 0 //initialisation de l'élément parcourant la liste de notes
        
        while index < songPlaying.listOfNotes.count {//si la chanson n'est pas finie
            if tracker.amplitude > 0.2 {//note jouée ou chantée
                
                if (Float(tracker.frequency) <= (songPlaying.listOfNotes[index].frequence + 0.5) &&
                    Float(tracker.frequency) >= (songPlaying.listOfNotes[index].frequence - 0.5))
                    //comparaison note jouée et note attendue
                    //on laisse un intervalle plus large pour les différents accordages
                    //en fonction des instruments
                {
                    index = index + 1
                    print(index)
                }
                else
                {
                    print(index)
                }
            }
        }
    }
}
