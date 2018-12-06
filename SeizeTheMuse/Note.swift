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
    let octave : Int
    var frequence : Double
    var position : Int
    
    init(name : String, octave : Int) {
        self.name = name
        self.octave = octave
        self.frequence = 0
        self.position = 0
        
        switch name {
        // Do dans la 6e ligne
        case "C" :
            self.frequence = self.mathFrequency(32.70, octave)
            self.position = mathPosition(93, octave)
            
        // Do # dans la 6e ligne
        case "C#" :
            self.frequence = self.mathFrequency(34.65, octave)
            self.position = mathPosition(93, octave)
            
        // Ré sur la 6e ligne
        case "D" :
            self.frequence = self.mathFrequency(36.71, octave)
            self.position = mathPosition(88, octave)
            
        // Ré # sur la 6e ligne
        case "D#" :
            self.frequence = self.mathFrequency(38.89, octave)
            self.position = mathPosition(88, octave)
            
        // Mi dans la 5e ligne
        case "E" :
            self.frequence = self.mathFrequency(41.20, octave)
            self.position = mathPosition(83, octave)
            
        // Fa sur la 5e ligne
        case "F" :
            self.frequence = self.mathFrequency(43.65, octave)
            self.position = mathPosition(78, octave)
            
        // Fa # sur la 5e ligne
        case "F#" :
            self.frequence = self.mathFrequency(46.25, octave)
            self.position = mathPosition(78, octave)
            
        // Sol dans la 4e ligne
        case "G" :
            self.frequence = self.mathFrequency(49.00, octave)
            self.position = mathPosition(73, octave)
        // Sol # dans la 4e ligne
        case "G#" :
            self.frequence = self.mathFrequency(51.91, octave)
            self.position = mathPosition(73, octave)
            
        // La sur la 4e ligne
        case "A" :
            self.frequence = self.mathFrequency(55.00, octave)
            self.position = mathPosition(68, octave)
            
        // La # sur la 4e ligne
        case "A#" :
            self.frequence = self.mathFrequency(58.27, octave)
            self.position = mathPosition(68, octave)
            
        // Si dans la 3e ligne
        case "B" :
            self.frequence = self.mathFrequency(61.74, octave)
            self.position = mathPosition(63, octave)
        default:
            break
        }
    }
    
    func mathFrequency(_ frequency: Double, _ octave: Int ) -> Double {
        var value = frequency
        for _ in 1...octave {
            value *= 2
        }
        return value
    }
    
    //Ne gère que l'octave 3 & 4
    func mathPosition(_ posY : Int, _ octave: Int) -> Int{
        if octave == 3 {
            return posY
        } else {
            return posY + 35
        }
    }
}
