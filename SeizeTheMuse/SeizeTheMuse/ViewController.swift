//
//  ViewController.swift
//  SeizeTheMuse
//
//  Created by LY David on 19/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let oscillator = AKOscillator()
        oscillator.amplitude = 0.1
        AudioKit.output = oscillator
        do {
            try AudioKit.start()
        } catch {
            print(error)
        }
        
        oscillator.start()
    }


}

