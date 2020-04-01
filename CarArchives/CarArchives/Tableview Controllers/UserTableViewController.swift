//
//  UserTableViewController.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-24.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
     let userCarData = CarDetailCoreData()
    
    var dataArray = [Data]()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        if isKeyPresentInUserDefaults(key: "hasCodeRun") == false
        {
        userCarData.createArray()
         userCarData.createCarData()
            UserDefaults.standard.set(true, forKey: "hasCodeRun")
        }
         userCarData.retrieveUserCarData()
        
        
         dataArray = userCarData.dataArray
        
    }
   
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! CarTableViewCell
        
        let value = dataArray[indexPath.row]

        cell.uImg.image = UIImage(named: value.image)
        cell.uName.text = value.name
        cell.uYear.text = value.year
        cell.uPrice.text = value.price
        cell.innerView.card()
        cell.shadowAndBorderForCell()
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let nvc = sb.instantiateViewController(withIdentifier: "userShow") as! CarDetailViewController
        nvc.data = dataArray[indexPath.row]
        //navigationController?.pushViewController(nvc, animated: true)
        present(nvc, animated: true, completion: nil)
    }
  
   
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    

}

