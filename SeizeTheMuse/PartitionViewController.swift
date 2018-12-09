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
    var song: Song
    var listOfStringOfNotes: [String]
    
    init(_ song: Song) {
        
        let instanceOfPartition = PartitionAndNotesViewController()
        instanceOfPartition.addAllNotes(listOfStringOfNotes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        //Use song here
        //chanson avec la liste de note déclarée en début de programme
        
        var index = 0 //initialisation de l'élément parcourant la liste de notes
        let instanceOfPartition = PartitionAndNotesViewController()
        
        while index < song.listOfNotes.count && !end {
            //tant que la chanson n'est pas finie
         
            if tracker.amplitude > 0.2 {//note jouée ou chantée
                
                if (Double(tracker.frequency) <= (song.listOfNotes[index].frequence + 0.5) &&
                    Double(tracker.frequency) >= (song.listOfNotes[index].frequence - 0.5))
                    //comparaison note jouée et note attendue
                    //on laisse un intervalle plus large pour les différents accordages
                    //en fonction des instruments
                {
                    index += 1
                    instanceOfPartition.animation()
                }
            }
        }
        endOfTheSong()
    }
    
    
    // Change screen
    public func endOfTheSong() {
        //segue have to pass the information
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
}
