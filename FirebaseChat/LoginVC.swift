//
//  LoginVC.swift
//  FirebaseChat
//
//  Created by admin on 2/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class LoginVC: UIViewController {

    let inputContainerView : UIView = {
       let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds  = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerBtn : UIButton =  {
       let btn = UIButton()
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor.white
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(UIColor(61, 91, 151, 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(registerBtnHandler), for: .touchUpInside)
        return btn
    }()
    
    let loginRegisterSegment : UISegmentedControl = {
        
       let segment = UISegmentedControl(items: ["Register","Login"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        segment.tintColor = .white
        segment.addTarget(self, action: #selector(segmentControll(_:)), for: .valueChanged)
        return segment
    }()
    
  
    let emailTxt : UITextField = {
       let txt = UITextField()
        txt.placeholder = "Email"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let nickNameTxt : UITextField = {
        let txt = UITextField()
        txt.placeholder = "Nickname"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    let passwordTxt : UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let profileImage  : UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named:"2")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImage)))
        return img
    }()
    
    let stackView = UIStackView()

    var inputViewHeight : NSLayoutConstraint?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(61, 91, 151, 1)
//        UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        self.view.addSubview(inputContainerView)
        self.view.addSubview(registerBtn)

        self.view.addSubview(profileImage)
//    setupTextField(targetView: emailTxt, topConsTo: inputContainerView)
        profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.view.addSubview(loginRegisterSegment)
        
        loginRegisterSegment.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 15).isActive = true
        loginRegisterSegment.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginRegisterSegment.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -50).isActive = true
        loginRegisterSegment.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        setupInputContainerView()

//        let stackV = UIStackView()
//        stackV.addArrangedSubview([emailTxt,nickNameTxt,passwordTxt])
//        setupTextField()
//        setupTextFieldnickName()
//        setupTextFieldPassword()
//        setupTextField(targetView: nickNameTxt, topConsTo: emailTxt)
//        setupTextField(targetView: passwordTxt, topConsTo: nickNameTxt)
//        setupTextFieldPassword()
       setupBtn()
        

     }
 
    @objc func segmentControll(_ sender : UISegmentedControl) {
        
        let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        self.registerBtn.setTitle(title, for: .normal)
        
        UIView.animate(withDuration: 0.3) {
            self.inputViewHeight?.constant = sender.selectedSegmentIndex == 0 ? 150 : 100
            self.view.layoutIfNeeded()
        }
    }
    
    
    func setupInputContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        inputContainerView.topAnchor.constraint(equalTo: self.loginRegisterSegment.bottomAnchor, constant: 15).isActive = true
        inputViewHeight = inputContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputViewHeight?.isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        
        inputContainerView.addSubview(stackView)
        stackView.backgroundColor = UIColor.blue
        stackView.addArrangedSubview(emailTxt)
        stackView.addArrangedSubview(passwordTxt)
        stackView.addArrangedSubview(nickNameTxt)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.spacing = 15
        stackView.backgroundColor = UIColor(61, 91, 151, 1)
        
        stackView.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 13).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        stackView.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: 8).isActive = true
//stackView.heightAnchor.constraint(equalToConstant: 100)
        
    }
    
//    func setupTextField(targetView : UITextField , topConsTo : UIView) {
    func setupTextField() {

        emailTxt.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 0).isActive = true
        emailTxt.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 0).isActive = true
        emailTxt.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: 0).isActive = true
        emailTxt.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0.333, constant: 0).isActive = true
     }
    func setupTextFieldPassword() {
        
        passwordTxt.topAnchor.constraint(equalTo: nickNameTxt.topAnchor, constant: 0).isActive = true
        passwordTxt.leadingAnchor.constraint(equalTo: nickNameTxt.leadingAnchor, constant: 0).isActive = true
        passwordTxt.trailingAnchor.constraint(equalTo: nickNameTxt.trailingAnchor, constant: 0).isActive = true
        passwordTxt.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0.333, constant: 0).isActive = true
    }
    func setupTextFieldnickName() {
        
        nickNameTxt.topAnchor.constraint(equalTo: emailTxt.topAnchor, constant: 0).isActive = true
        nickNameTxt.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 0).isActive = true
        nickNameTxt.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: 0).isActive = true
        nickNameTxt.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0.333, constant: 0).isActive = true
    }
    
    func setupBtn() {
        registerBtn.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor, constant: 0).isActive = true
        registerBtn.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true

        registerBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
        registerBtn.widthAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    
    
    @objc func registerBtnHandler() {
        print("HIHIHIHIHIHIHIIHIHIHi")
        
        guard let email = emailTxt.text , let pass = passwordTxt.text , let name = nickNameTxt.text  else {
            print("Ïnvalid Password and email")
            return
        }

        guard loginRegisterSegment.selectedSegmentIndex == 0 else {
            
            Auth.auth().signIn(withEmail: email, password: pass, completion: { (user : User?, err) in
                guard let user = user else {
                    print(err?.localizedDescription)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            })
            
            return
        }
        Auth.auth().createUser(withEmail: email, password: pass) { (user : User?, err) in
            guard   err == nil else {
                print("that;s the error : \(err?.localizedDescription) ")
                return
            }
            
            let ref = Database.database().reference(fromURL: "https://fir-chat-8c379.firebaseio.com/")
            let child = ref.child("Users").child(user!.uid)
            let dict : [String:Any] = ["email":email,"name":name]
            
           child.updateChildValues(dict)
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "EshraVC") as! EshraVC
//        self.present(vc , animated: true , completion: nil )
    }
    
    
}


extension LoginVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @objc func selectImage() {
        
        print("sadsasda")
        
    }
    
}

extension UIColor {
    
    convenience init(_ r : CGFloat  , _ g : CGFloat  , _ b : CGFloat ,_ alpha : CGFloat) {
        
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
