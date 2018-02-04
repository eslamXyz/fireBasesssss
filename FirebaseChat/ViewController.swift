//
//  ViewController.swift
//  FirebaseChat
//
//  Created by admin on 2/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout))
    }

  @objc  func logout() {
        
        let vc = LoginVC()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        self.present(vc, animated: true, completion: nil)
    }


}

