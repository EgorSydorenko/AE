//
//  SearchFilter.swift
//  AuctionExport
//
//  Created by Егор Сидоренко on 10/17/15.
//  Copyright © 2015 Егор Сидоренко. All rights reserved.
//

//import Foundation

import UIKit

class SearchFilterController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let vehicleTypePlaceHolder = "Vehicle Type"
    let makePlaceHolder = "Make"
    let modelPlaceHolder = "Model"
    let trimPlaceHolder = "Trim"
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var vehicleType: UITextField!
    
    let pickerData =
    //[
        //[10,11,12,13,14,15,16],
        ["Lexus","Toyota","Land Rover","Ford","Scion","Jaguar","Chevrolet"]
    //]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.pickerView.dataSource = self
        
        
        /*self.vehicleType.attributedPlaceholder = NSAttributedString(string: self.vehicleTypePlaceHolder, attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        
        var border = CALayer()
        var width = CGFloat(2.0)
        border.backgroundColor = UIColor.grayColor().CGColor
        border.frame = CGRect(x: 0, y: vehicleType.frame.height - 1, width: vehicleType.frame.width, height: 1.0)
        vehicleType.borderStyle = UITextBorderStyle.None
        vehicleType.layer.addSublayer(border)*/
        //Test Commit
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 15.0)!])
        return myTitle
    }
}