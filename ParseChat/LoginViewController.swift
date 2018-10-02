//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Cesar Gutierrez on 10/1/18.
//  Copyright © 2018 Cesar Gutierrez. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    let usernamealertController = UIAlertController(title: "Error", message: "Username is taken", preferredStyle: .alert)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        usernamealertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        usernamealertController.addAction(OKAction)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?,error: Error?) in
            if user != nil{
                print("You're Logged In")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print("Yay, created a user!")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print(error?.localizedDescription)
                if error?._code == 202{
                    print("User name is taken")
                   
                    UIApplication.shared.keyWindow?.rootViewController?.present(self.usernamealertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
            }
        }
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
