//
//  Note.swift
//  SeizeTheMuse
//
//  Created by LY David on 20/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import Foundation

struct Note {
    
    let name : String
    let frequence : Float
    let altered : Bool
    
    init(name : String, frequence : Float, altered : Bool) {
        self.name = name
        self.frequence = frequence
        self.altered = altered
        //let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
        //let noteNamesWithSharps = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
        //let noteNamesWithFlats = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
        //Voir comment faire pour controler/limiter la création de note
    }
    
}
