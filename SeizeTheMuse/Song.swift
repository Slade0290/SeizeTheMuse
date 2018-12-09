//
//  Song.swift
//  SeizeTheMuse
//
//  Created by LY David on 20/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import Foundation

struct Song {
    
    let title : String
    let author : String
    let listOfNotes : [Note]
    
    init(title : String, author : String, list : [Note]){
        self.title = title
        self.author = author
        self.listOfNotes = list
    }
    
}
