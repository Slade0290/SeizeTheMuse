//
//  SoundController.swift
//  SeizeTheMuse
//
//  Created by Bastien EL GANA on 05/12/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SoundController: UIViewController {
    var difficulty = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetLabel()
        SetTextFields()
    }
  
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    @IBOutlet weak var labelsound: UILabel!
    @IBOutlet weak var SoundName: UITextField!

    @IBOutlet weak var segmentedValue: UISegmentedControl!
    
    @IBAction func Difficulty(_ sender: Any) {
        switch segmentedValue.selectedSegmentIndex {
        case 0:
            difficulty = "Easy"
        case 1:
            difficulty = "Medium"
        case 2:
            difficulty = "Hard"
        default:
            difficulty = "None"
        }
    }
    
    @IBAction func btnRe3(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " D3"
    }
    
    @IBAction func btnMi3(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " E3"
    }
    
    @IBAction func btnFa3(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " F3"
    }
    
    @IBAction func btnSol3(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " G3"
    }
    
    @IBAction func btnLa3(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " A3"
    }
    
    @IBAction func btnSi3(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " B3"
    }
    
    @IBAction func btnDo4(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " C4"
    }
   
    @IBAction func btnMi4(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " E4"
    }
    
    @IBAction func btnFa4(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " F4"
    }
    
    @IBAction func btnSol4(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " G4"
    }
    
    @IBAction func btnRe4(_ sender: Any) {
        let tmp = labelsound.text
        labelsound.text = tmp! + " D4"
    }
    
    private func SetLabel(){
        labelsound.layer.borderWidth = 1
        labelsound.layer.borderColor = UIColor.white.cgColor
        labelsound.numberOfLines = 0
    }
    
    private func SetTextFields(){
        SoundName.delegate = self

        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(HideKeyBoard))
        view.addGestureRecognizer(tapgesture)
    }
    
    @objc private func HideKeyBoard(){
        SoundName.resignFirstResponder()
    }

    @IBAction func CreateSongDb(_ sender: Any) {
        let temp = labelsound.text
        let soundName = SoundName.text
        let userID = Auth.auth().currentUser?.uid
        
        if temp != "" || soundName != "" {
            let ref = Database.database().reference()
            ref.child("users").child(userID!).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                
                let Pseudo = value?["Pseudo"] as? String ?? "no Pseudo"
                let date = Date()
                let dateFormat = DateFormatter()
                dateFormat.dateFormat = "dd/MM/YYYY"
                let dateTime = dateFormat.string(from: date)
                
                
                let post = [
                    "author": Pseudo,
                    "son" : temp,
                    "title" :soundName!,
                    "date": dateTime,
                    "difficulty": self.difficulty

                ]
                
                
                ref.child("Sounds").childByAutoId().setValue(post)
                
            }
        } else {
            print("Erreur : Nom du son manquant ou son manquant")
        }
    }
    
}

extension SoundController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
