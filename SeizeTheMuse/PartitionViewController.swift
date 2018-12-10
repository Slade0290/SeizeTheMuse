//
//  PartitionViewController.swift
//  SeizeTheMuse
//
//  Created by Tanguy Ralaimiadana on 04/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI

class PartitionViewController: UIViewController {
    
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var end: Bool = false
    var song: Song?
    var listOfStringOfNotes: [String]?
    var imgTab: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addAllNotes(listOfStringOfNotes!)
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        drawPartition()
        addKey()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !end {
            
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        
        AudioKit.output = silence
         do {
         try AudioKit.start()
         }
         catch {
         AKLog("AudioKit did not start !")
         }
         Timer.scheduledTimer(timeInterval: 0.1,
         target: self,
         selector: #selector(PartitionViewController.updateUI),
         userInfo: nil,
         repeats: true)
        }
    }
    
    @objc func updateUI() {
        //Use song here
        //chanson avec la liste de note déclarée en début de programme
        
        var index = 0 //initialisation de l'élément parcourant la liste de notes
        
        while index < song!.listOfNotes.count && !end {
            //tant que la chanson n'est pas finie
         
            if tracker.amplitude > 0.2 {//note jouée ou chantée
                
                if (Double(tracker.frequency) <= (song!.listOfNotes[index].frequence + 0.5) &&
                    Double(tracker.frequency) >= (song!.listOfNotes[index].frequence - 0.5))
                    //comparaison note jouée et note attendue
                    //on laisse un intervalle plus large pour les différents accordages
                    //en fonction des instruments
                {
                    index += 1
                    animation()
                }
            }
        }
        endOfTheSong()
    }
    
    // Change screen
    public func endOfTheSong() {
        //segue have to pass the information
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
    
    
    
    // Screen width est la longueur en mode paysage
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    // Screen height est la largeur en mode paysage
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    // Add notes to the partition
    public func addAllNotes(_ tabOfNotes: [String]) {
        var y = 38
        
        for i in 1...tabOfNotes.count {
            let val = Int(song!.listOfNotes[i+1].position)
            addNotes(x: 24 + 50 * i, y: val)
            y += 5
        }
    }
    
    // Animation of the notes
    public func animation() {
        UIView.animate(withDuration: 1, animations: {
            for i in 0..<self.imgTab.count {
                self.imgTab[i].frame.origin.x -= 50
                self.hideNotes()
            }
        })
    }
    
    // Hide notes
    public func hideNotes() {
        for i in 0...self.imgTab.count {
            if Int(self.imgTab[i].frame.origin.x) < ((Int)(1 * 0.75)/2) {
                self.imgTab[i].isHidden = true
            }
        }
    }
    
    // Add treble clef
    func addKey(){
        let key = "cle_de_sol.png"
        let image = UIImage(named: key)
        let keyView = UIImageView(image: image!)
        keyView.frame = CGRect(x: 10, y: 56, width: 45, height: 80)
        view.addSubview(keyView)
    }
    
    // Add note match position
    func addNotes(x posX : Int, y posY : Int){
        let image = UIImage(named: "note.png")
        let noteView = UIImageView(image: image!)
        noteView.frame = CGRect(x: posX, y: posY, width: 38, height: 38)
        view.addSubview(noteView)
        addLabel(posX, posY)
        imgTab.append(noteView)
    }
    
    // Add label matching note
    func addLabel(_ posX : Int, _ posY : Int){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        label.center = CGPoint(x:posX + 12, y:140)
        label.textAlignment = .center
        
        switch(posY){
        case 38 :
            label.text = "sol"
        case 43 :
            label.text = "fa"
        case 48 :
            label.text = "mi"
        case 53 :
            label.text = "ré"
        case 58 :
            label.text = "do"
        case 63 :
            label.text = "si"
        case 68 :
            label.text = "la"
        case 73 :
            label.text = "sol"
        case 78 :
            label.text = "fa"
        case 83 :
            label.text = "mi"
        case 88 :
            label.text = "ré"
        default :
            label.text = ""
        }
        self.view.addSubview(label)
    }
    
    // Draw multiple black lines
    func drawPartition (){
        for i in 0...4 {
            drawLine(i * 10, 75)
        }
    }
    
    // Draw black line
    func drawLine(_ posY: Int, _ startPosY : Int){
        let linePath = UIBezierPath()
        
        // Start position
        let posStartX = 0
        let posEndX = Int(screenWidth)
        linePath.move(to: CGPoint(x: posStartX, y: posY + startPosY))
        
        linePath.addLine(to: CGPoint(x: posEndX, y: posY + startPosY))
        linePath.addLine(to: CGPoint(x: posEndX, y: 2 + posY + startPosY))
        linePath.addLine(to: CGPoint(x: posStartX, y: 2 + posY + startPosY))
        
        linePath.close()
        
        let line = CAShapeLayer()
        line.path = linePath.cgPath
        line.fillColor = UIColor.black.cgColor
        self.view.layer.addSublayer(line)
    }
}
