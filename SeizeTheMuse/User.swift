//
//  User.swift
//  SeizeTheMuse
//
//  Created by LY David on 20/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import Foundation

class User {
    
    let id : Int
    let email : String
    var nickName : String
    var password : String
    var listOfSongsPlayed : [Song]
    
    init(id : Int, email : String, nickName : String, password : String, list : [Song]){
        self.id = id
        self.email = email
        self.nickName = nickName
        self.password = password
        self.listOfSongsPlayed = list
    }
    
    
}
