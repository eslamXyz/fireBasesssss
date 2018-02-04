//
//  LoginVC.swift
//  FirebaseChat
//
//  Created by admin on 2/1/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

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
    let stackView = UIStackView()

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(61, 91, 151, 1)
//        UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        self.view.addSubview(inputContainerView)
        self.view.addSubview(registerBtn)
        self.view.addSubview(emailTxt)
        self.view.addSubview(nickNameTxt)
        self.view.addSubview(passwordTxt)

        setupInputContainerView()
//    setupTextField(targetView: emailTxt, topConsTo: inputContainerView)
        
        let stackV = UIStackView()
//        stackV.addArrangedSubview([emailTxt,nickNameTxt,passwordTxt])
//        setupTextField()
//        setupTextFieldnickName()
//        setupTextFieldPassword()
//        setupTextField(targetView: nickNameTxt, topConsTo: emailTxt)
//        setupTextField(targetView: passwordTxt, topConsTo: nickNameTxt)
//        setupTextFieldPassword()
       setupBtn()
        

     }
 
    
    func setupInputContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        
        inputContainerView.addSubview(stackView)
        stackView.backgroundColor = UIColor.blue
        stackView.addArrangedSubview(emailTxt)
        stackView.addArrangedSubview(nickNameTxt)
        stackView.addArrangedSubview(passwordTxt)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.spacing = 0
        
        
        stackView.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8).isActive = true
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
    }
    
    
}


extension UIColor {
    
    convenience init(_ r : CGFloat  , _ g : CGFloat  , _ b : CGFloat ,_ alpha : CGFloat) {
        
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
