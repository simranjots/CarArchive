//
//  AdminCarDetailsViewController.swift
//  CarArchives
//
//  Created by Simmun singh on 2020-03-29.
//  Copyright © 2020 Simranjot. All rights reserved.
//

import UIKit

class AdminCarDetailsViewController: UIViewController {

    @IBOutlet weak var dImage: UIImageView!
    @IBOutlet weak var dName: UILabel!
    @IBOutlet weak var dColor: UILabel!
    @IBOutlet weak var dYear: UILabel!
    @IBOutlet weak var dPrice: UILabel!
    @IBOutlet weak var dModel: UILabel!
    @IBOutlet weak var dVin: UILabel!
    
    
    
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dImage.makeRounded()
        dName.text = data.name
        dYear.text = data.year
        dColor.text = data.color
        dPrice.text = data.price
        dVin.text = data.vin
        dModel.text = data.model
        dImage.image = UIImage(named: data.image)
        
        
        // Do any additional setup after loading the view.
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

