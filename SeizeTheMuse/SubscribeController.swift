//
//  SubscribeController.swift
//  SeizeTheMuse
//
//  Created by Clement on 26/11/2018.
//  Copyright © 2018 LY David. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SubscribeController: UIViewController {

    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password1TextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetTextFields()
    }
    
    private func SetTextFields(){
        pseudoTextField.delegate = self
        emailTextField.delegate = self
        password1TextField.delegate = self
        password2TextField.delegate = self
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(HideKeyBoard))
        view.addGestureRecognizer(tapgesture)
    }
    
    @objc private func HideKeyBoard(){
        pseudoTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        password1TextField.resignFirstResponder()
        password2TextField.resignFirstResponder()
    }
    
    @IBAction func SubscribeButton(_ sender: UIButton) {
        
        if pseudoTextField.text != "" && emailTextField.text != "" && password1TextField.text != "" && password2TextField.text != ""{
            
            if password1TextField.text == password2TextField.text{
                
                
                Auth.auth().createUser(withEmail: emailTextField.text!, password: password1TextField.text!) { (authResult, error) in
                    if error != nil {
                        print(error.debugDescription)
                    } else {
                        print("Inscription de \(self.pseudoTextField.text ?? "no name") réussie ✅")
                        
                        let ref = Database.database().reference()
                        let userID = Auth.auth().currentUser?.uid
                        
                        ref.child("users").child(userID!).setValue(["Pseudo": self.pseudoTextField.text!])
                        
                        self.performSegue(withIdentifier: "GoToProfil", sender: self)
                        
                    }
                }
            }else{
                print("Erreur : Mot de passe différent")
            }
        }
        else{
            print("Erreur : un ou plusieurs champs sont vides")
        }
    }
    
    @IBAction func GoToLogin(_ sender: UIStoryboardSegue) {
        performSegue(withIdentifier: "GoToLogin", sender: nil)
    }
}

extension SubscribeController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
