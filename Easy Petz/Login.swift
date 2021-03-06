//
//  ViewController.swift
//  EazyPetz2
//
//  Created by Erick González on 4/30/18.
//  Copyright © 2018 Erick González. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    @IBAction func didTapEmailLogin(_sender: AnyObject) {
        if let email = self.userField.text, let pass = self.passwordField.text {
            showSpinner{
                Auth.auth().signIn(withEmail: email, password: pass){(user,error) in
                    self.hideSpinner{
                        if let error = error{
                            self.showMessagePrompt(error.localizedDescription)
                            return
                        }
                        self.navigationController!.popViewController(animated: true)
                    }
                    
                }
            }
        }
    }
}

