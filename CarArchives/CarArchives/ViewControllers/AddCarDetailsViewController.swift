//
//  AddCarDetailsViewController.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-29.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit
import CoreData

class AddCarDetailsViewController: UIViewController {
  
        
        @IBOutlet weak var addImage: UIImageView!
        @IBOutlet weak var addName: UITextField!
        @IBOutlet weak var addModel: UITextField!
        @IBOutlet weak var addYear: UITextField!
        @IBOutlet weak var addColor: UITextField!
        @IBOutlet weak var addVin: UITextField!
        @IBOutlet weak var addPrice: UITextField!
        
                
        
        override func viewDidLoad() {
            super.viewDidLoad()
            addImage.makeRounded()
            addImage.image = UIImage(named: "ferrari")
            // Do any additional setup after loading the view.
        }
        

        
        
    @IBAction func Donebtn(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "UserCarDetail", into: context)
            user.setValue("ferrari", forKey: "image")
            user.setValue(addName.text!, forKey: "name")
            user.setValue(addYear.text!, forKey: "year")
            user.setValue( addColor.text!, forKey: "color")
            user.setValue(addPrice.text!+"$", forKey: "price")
            user.setValue(addModel.text!, forKey: "model")
            user.setValue(addVin.text!, forKey: "vin")
            
            //print(n.color)
            
            do {
                try context.save()
                print(user,"success")
            } catch let error as NSError {
                
                print("Could not save. \(error), \(error.userInfo)")
            }
            
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nvc = sb.instantiateViewController(withIdentifier: "admincell") as! AdminTableViewController
        //navigationController?.pushViewController(nvc, animated: true)
        present(nvc, animated: true, completion: nil)
        
    }
    /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
 
     */
    
        
}
