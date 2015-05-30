//
//  ViewController.swift
//  secondtask
//
//  Created by Office-UpperSky-Hackintosh on 28/05/15.
//  Copyright (c) 2015 Jv. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btSearch: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var btPopular1: UIButton!
    @IBOutlet weak var btPopular2: UIButton!
    @IBOutlet weak var btPopular3: UIButton!
    @IBOutlet weak var btPopular4: UIButton!
    
    
    var pickerData : NSMutableArray = [
        ["id":1,"name":"Accounting"],
        ["id":2,"name":"Art & Design"],
        ["id":3,"name":"Biology"],
        ["id":4,"name":"Business & Finance"],
        ["id":5,"name":"Calculus"],
        ["id":6,"name":"Chemistry"],
        ["id":7,"name":"Economics"],
        ["id":8,"name":"Engineering"],
        ["id":9,"name":"English"],
        ["id":10,"name":"Environmental Science"],
        ["id":11,"name":"Foreign Languages"],
        ["id":12,"name":"Geology"],
        ["id":13,"name":"Health & Medical"],
        ["id":14,"name":"History"],
        ["id":15,"name":"Law"],
        ["id":16,"name":"Marketing"],
        ["id":17,"name":"Mathematics"],
        ["id":18,"name":"Philosophy"],
        ["id":19,"name":"Physics"],
        ["id":20,"name":"Political Science"],
        ["id":21,"name":"Computer Science"],
        ["id":22,"name":"Psychology"],
        ["id":23,"name":"Science"],
        ["id":24,"name":"Social Science"],
        ["id":25,"name":"Sociology"],
        ["id":26,"name":"Statistics"],
        ["id":27,"name":"Writing"],
        ["id":28,"name":"Other"],
        ["id":29,"name":"Algebra"],
        ["id":30,"name":"Programming"],
        ["id":31,"name":"Communications"],
        ["id":32,"name":"Film"],
        ["id":33,"name":"Management"],
        ["id":34,"name":"SAT"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        btPopular1.layer.cornerRadius = 38
        btPopular2.layer.cornerRadius = 38
        btPopular3.layer.cornerRadius = 38
        btPopular4.layer.cornerRadius = 38
        
      
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]["name"] as! String
    }
    
    //first index for ID, second for index of subject in array
    func findSubject(subjectName : String) -> [Int]{
        var response = [-1,-1]
        for index  in 0...pickerData.count-1{
            let subject: AnyObject = pickerData[index]
            if (subject["name"] as! String).lowercaseString == subjectName.lowercaseString{
                response = [subject["id"] as! Int,index]
                return response
            }
        }
        return response
    }
  
    @IBAction func searchButtonTapped(sender: UIButton) {
        tfSearch.resignFirstResponder()
        self.view.endEditing(true)
        
        let response = findSubject(tfSearch.text)
        if response[0] != -1 {
            picker.selectRow(response[1], inComponent: 0, animated: true)
        }
    }

}

