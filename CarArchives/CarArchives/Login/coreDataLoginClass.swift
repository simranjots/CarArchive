//
//  coreDataLoginClass.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-25.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit
import CoreData


class coreDataLoginClass: NSObject {
    
    var result = [NSManagedObject]()
    
    
   public func createLoginData() {
        
        // As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate =  UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //We need to create a context from this container.
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let's create an entity and newuser records.
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let adminEntity = NSEntityDescription.entity(forEntityName: "Admin", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        //here adding data
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue("simranjot", forKey: "username")
        user.setValue("simmu", forKey: "password")
        
        let admin = NSManagedObject(entity: adminEntity, insertInto: managedContext)
        admin.setValue("simranjot", forKey: "adminname")
        admin.setValue("simmu", forKey: "pass")
    
        do {
            try managedContext.save()
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
        }
    
    }
    
    func retrieveUserData() -> [NSManagedObject] {
        
        // As we know that container is set up in the AppDelegates so we need to refer that container.
        let appDelegate =  UIApplication.shared.delegate as? AppDelegate
        
        //We need to create a context from this container.
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        //prepare the request of type NSFetchRequest for the entity
        let fetchUser = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        
        do {
          result = try managedContext?.fetch(fetchUser) as! [NSManagedObject]
    
        } catch {
            
            print("Failed")
        }
        
        return result
        
    }
    
    func retrieveAdminData() -> [NSManagedObject] {
        
        // As we know that container is set up in the AppDelegates so we need to refer that container.
        let appDelegate =  UIApplication.shared.delegate as? AppDelegate
        
        //We need to create a context from this container.
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        //prepare the request of type NSFetchRequest for the entity
        let fetchAdmin = NSFetchRequest<NSFetchRequestResult>(entityName: "Admin")
        
        do {
            result = try managedContext?.fetch(fetchAdmin) as! [NSManagedObject]
            
        } catch {
            
            print("Failed")
        }
        
        return result
        
    }
    

}
