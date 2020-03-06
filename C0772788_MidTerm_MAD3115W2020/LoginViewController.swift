//
//  ViewController.swift
//  C0772788_MidTerm_MAD3115W2020
//
//  Created by Avani Patel on 3/5/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRememberMeValues()
        // Do any additional setup after loading the view.
    }
    
    private func getRememberMeValues()
    {
        let userdefault = UserDefaults.standard
        if let email = userdefault.string(forKey: "userEmail")
        {
            txtUserName.text = email
            
            if let pwd = userdefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
            }
        }
    }

    @IBAction func btnNextClick(_ sender: UIButton) {
        if self.txtUserName.text == "asdfg@gmail.com" && self.txtPassword.text == "asd.123"
        {
            let userdefault = UserDefaults.standard
            if switchRememberMe.isOn
            {
                userdefault.setValue(txtUserName.text, forKey: "userEmail")
                userdefault.set(txtPassword.text, forKey: "userPassword")
            }
            else
            {
                userdefault.removeObject(forKey: "userEmail")
                userdefault.removeObject(forKey: "userPassword")
            }
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Try Again, User Email/Password is incorrect ", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        
    }
    
    @IBAction func unWindLogoutFromAnyScreen(storyboardSegue: UIStoryboardSegue)
    {
        print("Logout")
//        let s = storyboardSegue.source as! CustomerListTableViewController
        //print(s.lblWelcome.text!)
        
//        txtPassword.text = ""
//        txtUserName.text = ""
    }

}

