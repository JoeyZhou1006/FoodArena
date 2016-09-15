//
//  BusinessInitialProfileViewController.swift
//  Login_Firebase
//
//  Created by Zhou Yu on 8/09/2016.
//  Copyright © 2016 Joey Zhou. All rights reserved.
//

import UIKit
import Firebase

class BusinessInitialProfileViewController: UIViewController {
    
    //create firebase storage reference
    let StorageRef = FIRDatabase.database().reference()
    
    
    
    //here should have a reference uid of the user
    var Uid = ""
    
    override func viewWillAppear(animated: Bool) {
        print("signed up users uid is "+self.Uid)
    }
    
    
    
      var exists = false
    
  
    
    @IBOutlet weak var inputName: UITextField!
    
    
    

  
    @IBAction func submitBusinessName(sender: AnyObject) {
        
        //check whether someone already registered with this names
        
        
        //checkWhetherBusinessNameExists()
        //sent the current users name associated with the uid to the firebase storage
        
        //1. create a reference to the storage of the firebase

        //workng code
        //save the business names associated to the business users uid under the business users database
//        

//        let serialQueue = dispatch_queue_create("com.JoeyZhou.Login-Firebase", DISPATCH_QUEUE_SERIAL)
//        
//
//        
//        dispatch_async(serialQueue) { () -> Void in
//            
//            self.checkWhetherBusinessNameExists()
//            
//            dispatch_async(dispatch_get_main_queue(), {
//                if(self.exsits == false){
//                    self.StorageRef.child("businessUsers").child(self.Uid).child("Business_Names").setValue(self.inputName.text)
//                    print("the name is not exists")
//                }
//                else{
//                    print("the name is already existsssss")
//                }
//            })
//        }
       self.checkWhetherBusinessNameExists()
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 4)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
            if(self.exists == false){
                //self.StorageRef.child("businessUsers").child(self.Uid).child("Business_Names").setValue(self.inputName.text)
                print("the name is not exists")
            }
            else{
                print("the name is already existsssss")
            }

        })
        
        
        
        
        

            
        
}
    
    
    
    //this function should search through all the business users, and check the child attribute "name" whether exsits or not
    @IBAction func dismissCurrentView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
    func checkWhetherBusinessNameExists(){
        
      
        
        
        StorageRef.child("businessUsers").observeSingleEventOfType(FIRDataEventType.Value, withBlock: {(snapshot) in
           
            //if let snapshots = snapshot.children.allObjects
            //go through all the business users profile stored in firebase
            
            for child in snapshot.children{
                
                
                //if the business name is already exists, set exists == true, and jump out of the loop,
                if (child.value["Business_Names"] as! String? == self.inputName.text){
                   print("this business name is already occupied")
                    //true value is not inserted properly
                    self.exists = true
                    print("should return trueeeeeeeeeeee, while the result is ",self.exists)
                    return
                }
            }
            
        })
    }
//    func checkWhetherBusinessNameExists(){
//
//            self.StorageRef.child("businessUsers").observeSingleEventOfType(FIRDataEventType.Value, withBlock: {(snapshot) in
//                
//                //if let snapshots = snapshot.children.allObjects
//                //go through all the business users profile stored in firebase
//                
//                for child in snapshot.children{
//                    
//                    
//                    //if the business name is already exists, set exists == true, and jump out of the loop,
//                    if (child.value["Business_Names"] as! String? == self.inputName.text){
//                       
//                            print("this business name is already occupied")
//                            //true value is not inserted properly
//                            self.exsits = true
//                            return
//                            
//                        }
//                }
//                
//            })
//        
//
//        
//            }
    
    
    

}
