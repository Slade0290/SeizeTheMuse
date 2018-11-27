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
        
        // TODO : position
        //Voir comment faire pour controler/limiter la création de note
        //Dessinner la ligne environ 50 px pour cette note uniquement à la position de la note /2 en x et y
        
        switch name {
        // Do dans la 6e ligne
            case "C" :
                self.frequence = mathFrequency(32.70, octave)
                self.position = 0
            
        // Do # dans la 6e ligne
            case "C#" :
                self.frequence = self.mathFrequency(34.65, octave)
                self.position = 0
            
        // Ré sur la 6e ligne
            case "D" :
                self.frequence = self.mathFrequency(36.71, octave)
                self.position = 0
            
        // Ré # sur la 6e ligne
            case "D#" :
                self.frequence = self.mathFrequency(38.89, octave)
                self.position = 0
            
        // Mi dans la 5e ligne
            case "E" :
                self.frequence = self.mathFrequency(41.20, octave)
                self.position = 0
            
        // Fa sur la 5e ligne
            case "F" :
                self.frequence = self.mathFrequency(43.65, octave)
                self.position = 0
            
        // Fa # sur la 5e ligne
            case "F#" :
                self.frequence = self.mathFrequency(46.25, octave)
                self.position = 0
        
        // Sol dans la 4e ligne
            case "G" :
                self.frequence = self.mathFrequency(49.00, octave)
                self.position = 0
        // Sol # dans la 4e ligne
            case "G#" :
                self.frequence = self.mathFrequency(51.91, octave)
                self.position = 0
        
        // La sur la 4e ligne
            case "A" :
                self.frequence = self.mathFrequency(55.00, octave)
                self.position = 0
        
        // La # sur la 4e ligne
            case "A#" :
                self.frequence = self.mathFrequency(58.27, octave)
                self.position = 0
        
        // Si dans la 3e ligne
            case "B" :
                self.frequence = self.mathFrequency(61.74, octave)
                self.position = 0
            default:
                break
        }
        
        // if position > depasse de la portée alors il faut dessiner des traits en plus en foncion de l'octave
    }
    
    func mathFrequency(_ frequency: Double, _ octave: Int ) -> Double {
        var value = frequency
            for _ in 1...octave {
                value *= 2
            }
        return value
    }
    
    func mathPosition(_ name: String, _ octave: Int) -> Int{
        var value = 0
            value = 1 // for ? because octave 3 position define then if octave sup then val="get pts between 2 notes"
        return value
    }
}
