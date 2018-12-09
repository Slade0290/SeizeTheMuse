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
    @IBOutlet weak var DurationText: UILabel!
    @IBOutlet weak var DateText: UILabel!
    @IBOutlet weak var NbrPlayed: UILabel!
    @IBOutlet weak var Currenty: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let son:Song = songs[myIndex]
        TitleText.text = son.title
        AuthorText.text = son.author
        
    }

}
