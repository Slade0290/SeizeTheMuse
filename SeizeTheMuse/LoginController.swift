//
// ViewController.swift
// SeizeTheMuse
//
//
// Created by Bastien EL GANA on 21/11/2018
// Copyright 2018 LY David. All rights reserved

import UIKit
//import AudioKit
import FirebaseAuth

class LoginController: UIViewController {


    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
 	override func viewDidLoad() {
		super.viewDidLoad()
        setupTextfieldsManaging()
	}
    
    private func setupTextfieldsManaging() {
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(HideKeyBoard))
        view.addGestureRecognizer(tapgesture)
    }
    
    @objc private func HideKeyBoard(){
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text!) { (authResult, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                self.performSegue(withIdentifier: "GoToProfil2", sender: self)
            }
        }
    }
    
    @IBAction func GoToSubscribe(_ sender: UIStoryboardSegue) {
        performSegue(withIdentifier: "GoToSub", sender: nil)
    }
}

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
