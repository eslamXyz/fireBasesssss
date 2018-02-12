//
//  ViewController.swift
//  FirebaseChat
//
//  Created by admin on 2/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase

class MainPageVC: UIViewController {
    
    let ref = Database.database().reference(fromURL: "https://fir-chat-8c379.firebaseio.com/")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
        
        let img = UIImage(named : "settings-2")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: img , style: .plain, target: self, action: #selector(handleNewSMS))
        
        checkIfUserLoggedIn()
    }
    
    @objc func handleNewSMS() {
        
//        print("New SMS")
        
        let vc = NewSmsVC()
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
    }
    
    func checkIfUserLoggedIn() {
        guard let userID =  Auth.auth().currentUser?.uid   else {
            
            perform(#selector(logout), with: nil, afterDelay: 0 )
            logout()
            return
        }
        
        ref.child("Users").child(userID).observe(DataEventType.value) { (snapShot) in
            
            guard let data = snapShot.value as? [String:Any] else {
                
                return
            }
            print(data)
            self.title = data["name"] as? String
            
            
        }
        
        
    }
    
    @objc  func logout() {
        
        self.title = ""
        do {
            try     Auth.auth().signOut()
        }catch let err {
            
            print(err.localizedDescription)
        }
        
        let vc = LoginVC()
        //        self.navigationController?.pushViewController(vc, animated: true)
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
}


