//
//  NewSmsVC.swift
//  FirebaseChat
//
//  Created by admin on 2/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Firebase


class NewSmsVC: UITableViewController {

    
    //MARK: Vars
    var data : [Users] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismisView))
fetchUser()
        
        self.tableView.register(UserCell.self , forCellReuseIdentifier: "CELL")
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.dataSource = self
        tableView.delegate = self
    }

   @objc func dismisView() {
//        self.dismiss(animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)
    }
    
    func fetchUser() {
        
        
        Database.database().reference().child("Users").observe(DataEventType.childAdded, with: { (snapshot ) in
            guard let data = snapshot.value as? [String : Any] else {
                return
            }
            print(data)
            DispatchQueue.main.async {
                let user = Users()
                user.name = data["name"] as? String
                user.email = data["email"] as? String
                self.data.append(user)
                self.tableView.reloadData()
            }
            print(data)
            
            
        }, withCancel: nil  )
            
            

        }
        
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text =    data[indexPath.row].name
        cell.detailTextLabel?.text = data[indexPath.row].email
        return cell
    }
    

}


class UserCell : UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
