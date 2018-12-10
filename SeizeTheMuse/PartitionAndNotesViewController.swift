//
//  PartitionAndNotesViewController.swift
//  SeizeTheMuse
//
//  Created by LY David on 06/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit

class PartitionAndNotesViewController: UIViewController {
    
    var imgTab: [UIImageView] = []
    
    convenience init() {
        self.init(nibName:nil, bundle:nil)
    }
    
    // Screen width est la longueur en mode paysage
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    // Screen height est la largeur en mode paysage
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        drawPartition()
        addKey()
    }
    
    // Add notes to the partition
    public func addAllNotes(_ tabOfNotes: [String]) {
        var y = 38
        
        for i in 1...tabOfNotes.count {
            addNotes(x: 0 * i, y: 0)
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
