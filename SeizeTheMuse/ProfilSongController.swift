//
//  ProfilSongController.swift
//  SeizeTheMuse
//
//  Created by LY David on 09/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit

class ProfilSongController: UIViewController {

    var author: String = ""
    var son: String = ""
    var songTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let partitionVC: PartitionViewController = segue.destination as! PartitionViewController
        var list: [Note]?
        var listOfNotes: [String]?
        
        let spaceCount = son.filter{$0 == " "}.count
        var tabNotes = son.components(separatedBy: " ")
        
        for i in 0...spaceCount {
            let note: String = tabNotes[i]
            let name = note.first
            var octave = 0
            if let tryOctave = Int(String(note.last!)) {
                octave = tryOctave
            } else {
                // Octave par défaut
                octave = 3
            }
            
            let tmpNote = Note(String(name!), octave)
            list?.append(tmpNote)
            listOfNotes?.append(note)
        }

        let currentSong = Song(songTitle, author, list!)
        partitionVC.song = currentSong
        partitionVC.listOfStringOfNotes = listOfNotes!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
