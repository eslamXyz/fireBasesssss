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
        
        if Auth.auth().currentUser?.uid == nil {
            
            perform(#selector(logout), with: nil, afterDelay: 0)
            logout()
        }
    }

  @objc  func logout() {
    
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

