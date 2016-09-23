//
//  SignInViewController.swift
//  Login_Firebase
//
//  Created by Zhou Yu on 6/09/2016.
//  Copyright © 2016 Joey Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    
    @IBOutlet weak var signInEmail: UITextField!

    @IBOutlet weak var signInPassword: UITextField!
    
    var ref = FIRDatabase.database().reference()
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        insertInvitationCodeToFirebase()
//    }
//
//    
    
    @IBAction func loginAction(_ sender: AnyObject) {
        //when the user input both email address field and password field
        if (signInEmail.text != nil && signInPassword.text != nil) {
            //connect to the firebase and check the existence of this account and the account should be trimmed
            FIRAuth.auth()?.signIn(withEmail: signInEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines), password: signInPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {(user, error) in
                //when the user input the wrong email address or password, ask user to input again
                if(error != nil){
                    print("Either the input email address or password is incorrect, please try it again")
                    print(error)
                }
                else{
                    print("user with email address "+user!.email!+"is successfully logged in")
                    self.navigateToBusinessUserHomePage()
                    
                
                }
            }
        }
    }
    
    
    @IBAction func backToPreviousMenu(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: {})
    }
    
    
    
    func navigateToBusinessUserHomePage(){
        self.performSegue(withIdentifier: "businessSignedIn", sender: self)
        
        
    }
    

    //temprory function to insert temporary invitation key to the firebase
//    func insertInvitationCodeToFirebase(){
//        self.ref.child("InvitationCode").child("Invitation1").setValue("1234")
//        
//    }
//    
    
    
    
    
    
}
