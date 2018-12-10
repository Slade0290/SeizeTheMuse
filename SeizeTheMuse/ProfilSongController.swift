//
//  ProfilSongController.swift
//  SeizeTheMuse
//

//  Created by Clement on 09/12/2018.

//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit

class ProfilSongController: UIViewController {


    @IBOutlet weak var TitleText: UILabel!
    @IBOutlet weak var AuthorText: UILabel!
    @IBOutlet weak var Difficulty: UILabel!
    @IBOutlet weak var DateText: UILabel!

    var author: String = ""
    var son: String = ""
    var songTitle: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let son:SongBis = songs[myIndex]
        TitleText.text = son.title
        AuthorText.text = son.author
        Difficulty.text = son.difficulty
        DateText.text = son.date
        self.son = son.son!
        
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToPartition"{
            
        
        let partitionVC: PartitionViewController = segue.destination as! PartitionViewController
        
        var list = [Note]()
        var listOfNotes = [String]()
        print("--------------------------------------------")
        print(son)
        print(TitleText.text)
        print(AuthorText.text)
        print("--------------------------------------------")
        
        let spaceCount = son.filter{$0 == " "}.count
        var tabNotes = son.components(separatedBy: " ")
        print("--------------------------------------------")
        print(spaceCount)
        print("--------------------------------------------")
        
        for i in 0...spaceCount {
            if tabNotes[i].count != 0 {
                let note: String = tabNotes[i]
                print("--------------------------------------------")
                print(tabNotes)
                print("--------------------------------------------")
                
                let name = note.first
                print("--------------------------------------------")
                print(name)
                print("--------------------------------------------")
                
                var octave = 0
                if let tryOctave = Int(String(note.last!)) {
                    octave = tryOctave
                } else {
                    // Octave par défaut
                    octave = 3
                }
                
                let tmpNote = Note(String(name!), octave)
                print("--------------------------------------------")
                print(tmpNote)
                print("--------------------------------------------")

                list.append(tmpNote)
                listOfNotes.append(note)
            }
            
        }
        print(list)
        let currentSong = Song(songTitle, author, list)
        partitionVC.song = currentSong
        partitionVC.listOfStringOfNotes = listOfNotes
        }
    }
}
