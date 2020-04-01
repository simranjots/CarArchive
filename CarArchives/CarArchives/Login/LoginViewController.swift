//
//  LoginControllerViewController.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-25.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {

    var username = ""
    var password = ""
    var iconclick = true
    var log = ""
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var passtext: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var icon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passtext.isSecureTextEntry = true
        
        if log == "user"{
            
            loginImage.image = UIImage(named: "user")
            
        }else{
            
            loginImage.image = UIImage(named: "administrator")
        }
                
    }
    

    @IBAction func eyeicon(_ sender: Any) {
        
        iconclick = !iconclick
        
        if (iconclick == true) {
            icon.setImage(UIImage(named: "icons8-closed-eye-100"), for: .normal)
            passtext.isSecureTextEntry = true
        }else{
            icon.setImage(UIImage(named: "icons8-eye-100"), for: .normal)
            passtext.isSecureTextEntry = false

        }
        
        
    }
    
    @IBAction func loginbtn(_ sender: Any) {
        
        if log == "user" {
            
            if ((nametext.text?.lowercased() == username) && (passtext.text?.lowercased() == password) ){
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let nvc = sb.instantiateViewController(withIdentifier: "usercell") as! UserTableViewController

               //navigationController?.pushViewController(nvc, animated: true)
                present(nvc, animated: true, completion: nil)
                
                
            }else{
                
                let alert = UIAlertController(title: "Failed", message: "Please enter the correct username or password", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
            
        }
        
        if log == "admin" {
            if ((nametext.text?.lowercased() == username) && (passtext.text?.lowercased() == password) ){
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let nvc = sb.instantiateViewController(withIdentifier: "admincell") as! AdminTableViewController
                //navigationController?.pushViewController(nvc, animated: true)
                present(nvc, animated: true, completion: nil)
                
                
            }else{
                
                let alert = UIAlertController(title: "Failed", message: "Please enter the correct username or password", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
        
     
        
    }
    

}

