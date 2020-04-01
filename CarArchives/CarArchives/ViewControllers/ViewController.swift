//
//  ViewController.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-24.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coreLogin = coreDataLoginClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!);        coreLogin.createLoginData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func userlogbtn(_ sender: Any) {
       let logUser = coreLogin.retrieveUserData()
        let username =  logUser[0].value(forKey: "username") as! String
        let password =  logUser[0].value(forKey: "password") as! String
        
    let nvc = storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        nvc.username = username
        nvc.password = password
        nvc.log = "user"
        
        present(nvc, animated: true, completion: nil)
    }
    
    
    @IBAction func adminlogbtn(_ sender: Any) {
        let logAdmin = coreLogin.retrieveAdminData()
        let adminname =  logAdmin[0].value(forKey: "adminname") as! String
        let pass =  logAdmin[0].value(forKey: "pass") as! String
        
    let nvc = storyboard?.instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
        nvc.username = adminname
        nvc.password = pass
        nvc.log = "admin"

        DispatchQueue.main.async {
            nvc.nameLabel.text = "Adminname :"
        }
        present(nvc, animated: true, completion: nil)
    }
   
    
}

