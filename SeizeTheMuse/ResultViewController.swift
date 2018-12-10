//
//  ResultViewController.swift
//  SeizeTheMuse
//
//  Created by LY David on 09/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var goodNotes: UILabel!
    @IBOutlet weak var achievement: UILabel!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
