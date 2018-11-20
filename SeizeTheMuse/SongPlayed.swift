//
//  SongPlayed.swift
//  SeizeTheMuse
//
//  Created by LY David on 20/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import Foundation

struct SongPlayed {
    
    let songTitle : String
    let score : Int
    
    init(title : String, score : Int) {
        self.songTitle = title
        self.score = score
    }
}
