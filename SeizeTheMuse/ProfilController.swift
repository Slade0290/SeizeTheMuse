//
//  ProfilController.swift
//  SeizeTheMuse
//
//  Created by Clement on 26/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfilController: UIViewController {

    @IBOutlet weak var PseudoAfficher: UILabel!
    @IBOutlet weak var EmailAfficher: UILabel!
    @IBOutlet weak var PasswordAfficher: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser{
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            
            ref.child("users").child(userID!).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                
                let Pseudo = value?["Pseudo"] as? String ?? "no Pseudo"
                
                self.PseudoAfficher.text = Pseudo
                self.EmailAfficher.text = user.email
            }

        }else{
            fatalError("Erreur : aucun utilisateur est connecté lors de l'affichage de l'écran d'accueil")
        }
    }
            

    @IBAction func ChangePasswordButton(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func GoToSongPlayed(_ sender: UIStoryboardSegue) {
    }
}
