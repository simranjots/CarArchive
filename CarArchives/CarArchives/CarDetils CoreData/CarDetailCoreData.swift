//
//  CarDetailCoreData.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-26.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit
import CoreData

class CarDetailCoreData: NSObject {
    var d = [Data]()
    var dataArray = [Data]()
    
    
    var cars = [(name: "Ferrari" ,year: "2010" ,color: "Red" ,price: "500000$",imageName : "ferrari sa aperta",model : "559",vin: "100000"),(name: "BMW" ,year: "2011" ,color: "Blue" ,price: "450000",imageName : "BMW",model : "560",vin: "200000"),(name: "Honda" ,year: "2012" ,color: "Blue" ,price: "650000",imageName : "honda",model : "561",vin: "300000"),(name: "Audi" ,year: "2013" ,color: "Red" ,price: "750000",imageName : "Audi",model : "562",vin: "400000"),(name: "Porsche" ,year: "2014" ,color: "White" ,price: "850000",imageName : "Porsche",model : "563",vin: "abc"),(name: "Lamborghini" ,year: "2015" ,color: "Black" ,price: "950000",imageName : "lamborghini",model : "950",vin: "600000")]
    
    
    
    func createArray()
    {
        
        for i in cars
        {
            let data = Data()
            data.name = i.name
                        data.color = i.color
                        data.year = i.year
                        data.model = i.model
                       data.price = i.price
                        data.image = i.imageName
                        data.vin = i.vin
            
                       d.append(data)
            print(data.name, "create array")
        
        }
        
    }
    
    
    public func createCarData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
       
        for i in d{
         let user = NSEntityDescription.insertNewObject(forEntityName: "UserCarDetail", into: context)
        user.setValue(i.image, forKey: "image")
        user.setValue(i.name, forKey: "name")
        user.setValue(i.year, forKey: "year")
        user.setValue(i.color, forKey: "color")
        user.setValue(i.price, forKey: "price")
        user.setValue(i.model, forKey: "model")
        user.setValue(i.vin, forKey: "vin")
        
            //print(n.color)
        
        do {
            try context.save()
            print(user,"success")
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    }

    func retrieveUserCarData() {
        
        // As we know that container is set up in the AppDelegates so we need to refer that container.
        let appDelegate =  UIApplication.shared.delegate as? AppDelegate
        
        //We need to create a context from this container.
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        //prepare the request of type NSFetchRequest for the entity
        let fetchUser = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCarDetail")
        
        
        
        if let result = try? managedContext?.fetch(fetchUser){
                for object in result as! [NSManagedObject] {
                    print(" image  \(object.value(forKey: "image") as! String)")
                    let image = object.value(forKey: "image") as! String
                    let name = object.value(forKey: "name") as! String
                    let year = object.value(forKey: "year") as! String
                    let price = object.value(forKey: "price") as! String
                    let color = object.value(forKey: "color") as! String
                    let vin = object.value(forKey: "vin") as! String
                    let model = object.value(forKey: "model") as! String
                    
                    let data = Data()
                    
                    data.name = name
                    data.year = year
                    data.color = color
                    data.image = image
                    data.model = model
                    data.vin = vin
                    data.price = price
                    
//                    print("i \(data.name)")
//                    print(" i \(data.vin)")
//                    print(vin)
                    print(data)
                    
                    
                    dataArray.append(data)
                }
                
            
            
        }
        
        
    }
    

    
    
}
