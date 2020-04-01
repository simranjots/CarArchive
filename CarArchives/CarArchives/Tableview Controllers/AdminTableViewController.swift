//
//  AdminTableViewController.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-24.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit
import CoreData

class AdminTableViewController: UITableViewController {

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "adminCell", for: indexPath) as! AdminCarTableViewCell
        
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
        let nvc = sb.instantiateViewController(withIdentifier: "adminShow") as! AdminCarDetailsViewController
        nvc.data = dataArray[indexPath.row]
        //navigationController?.pushViewController(nvc, animated: true)
        present(nvc, animated: true, completion: nil)
    }
    
    
    
    //swipe actions
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        // second action for delete
        let action1 = UIContextualAction(
            style: .normal,
            title: "Delete Car",
            handler: { (action, view, completion) in
                
                let   appdelegate = UIApplication.shared.delegate as! AppDelegate;
                
                let context = appdelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCarDetail")
                fetchRequest.returnsObjectsAsFaults = false
                
                
//                let predicate = NSPredicate(format: "price=%@", "\(self.price)")
//                fetchRequest.predicate = predicate
                
                do
                {
                    let x = try context.fetch(fetchRequest)
                    let result = x as! [UserCarDetail]
                    print(result.count)
                    
                    print("deleting \(result[indexPath.row])")
                    context.delete(result[indexPath.row])
                    //print(zotes)
                    print(indexPath.row )
                    do
                    {
                        try context.save()
                    }
                    catch{
                        
                        print("error")
                    }
                    self.dataArray.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    tableView.reloadData()
                    
                }
                catch
                {
                    
                }
                
                completion(true)
        })
        action1.backgroundColor = .red
        ///action1.image = UIImage(systemNAme:"trash")
        
        
        let configuration = UISwipeActionsConfiguration(actions: [action1])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
   

}
extension UIView{
    
    func card(){
    self.layer.cornerRadius = 5
    //self.layer.borderWidth = 0
    self.layer.borderColor = UIColor.lightGray.cgColor
    self.layer.masksToBounds = true
    self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath

    }
    func shadowAndBorderForCell(){
        // SHADOW AND BORDER FOR CELL
        //yourTableViewCell.contentView.layer.cornerRadius = 5
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
       
    }
    func makeRounded() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}

