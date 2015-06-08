//
//  ViewController.swift
//  secondtask
//
//  Created by Office-UpperSky-Hackintosh on 28/05/15.
//  Copyright (c) 2015 Jv. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate {

    //UI links
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btSearch: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var btPopular1: UIButton!
    @IBOutlet weak var btPopular2: UIButton!
    @IBOutlet weak var btPopular3: UIButton!
    @IBOutlet weak var btPopular4: UIButton!
    var btPopular1Title: String!
    var btPopular2Title: String!
    var btPopular3Title: String!
    var btPopular4Title: String!
    @IBOutlet weak var viewContent: UIView!
    
    @IBOutlet weak var navigation: UINavigationItem!
    
    //DATA
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
    //to check if one Popular Button is tapped
    var buttonTapped : UIButton?
    let blueColor = UIColor(netHex: 0x2ABFFF)
    let greyColor = UIColor(netHex: 0xBBBBBB)

    override func viewDidLoad() {
        super.viewDidLoad()
     
        //SHADOWS
        tfSearch.layer.shadowOpacity = 0.3
        tfSearch.layer.shadowColor = UIColor.blackColor().CGColor
        tfSearch.layer.shadowOffset = CGSizeMake(0.0,3.0)
        tfSearch.layer.masksToBounds = false
        tfSearch.layer.shadowRadius = 2.5
        
        picker.layer.shadowOpacity = 0.4
        picker.layer.shadowColor = UIColor.blackColor().CGColor
        picker.layer.shadowOffset = CGSizeMake(0.0,1.0)
        picker.layer.masksToBounds = false
        picker.layer.shadowRadius = 1.0
            
        tfSearch.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        view.backgroundColor = UIColor(netHex: 0xF0F0ED)
        
        //SET Popular Button Subject
        btPopular1.layer.cornerRadius = 34
        btPopular1Title = pickerData[0]["name"] as? String
        btPopular2.layer.cornerRadius = 34
        btPopular2Title = pickerData[1]["name"] as? String
        btPopular3.layer.cornerRadius = 34
        btPopular3Title = pickerData[2]["name"] as? String
        btPopular4.layer.cornerRadius = 34
        btPopular4Title = pickerData[3]["name"] as? String
        
        tfSearch.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        //SET navigation bar color and Font
        var nav = self.navigationController?.navigationBar
        nav?.tintColor = blueColor
        nav?.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Armonioso", size: 20)!,NSForegroundColorAttributeName: blueColor]
        
        //SHADOW
        nav?.layer.shadowOpacity = 0.3
        nav?.layer.shadowColor = UIColor.blackColor().CGColor
        nav?.layer.shadowOffset = CGSizeMake(0.0,3.0)
        nav?.layer.masksToBounds = false
        nav?.layer.shadowRadius = 2.5
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
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]["name"] as String
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: pickerData[row]["name"] as String, attributes: [NSForegroundColorAttributeName : greyColor])
        return attributedString
    }

    //first index for ID, second for index of subject in array
    //For every subject, it checks if subjectName is in
    func findSubject(subjectName : String) -> [Int]{
        var response = [-1,-1]
        for index  in 0...pickerData.count-1{
            let subject: AnyObject = pickerData[index]
            if (subject["name"]as String).lowercaseString.contains(subjectName.lowercaseString) {
                response = [subject["id"] as Int,index]
                return response
            }
        }
        return response
    }
  
    //Search button Action
    @IBAction func searchButtonTapped(sender: UIButton) {
        tfSearch.resignFirstResponder()
        self.view.endEditing(true)
        
        changePickerRow(tfSearch.text)
    }

    //ALL Popular Buttons Action
    @IBAction func btPopular1Tapped(sender: UIButton) {
        changePickerRow(btPopular1Title!)
        changeButtonTapped(sender)
    }
    @IBAction func btPopular2Tapped(sender: UIButton) {
        changePickerRow(btPopular2Title!)
        changeButtonTapped(sender)
    }
    @IBAction func btPopular3Tapped(sender: UIButton) {
        changePickerRow(btPopular3Title)
        changeButtonTapped(sender)
    }
    
    @IBAction func btPopular4Tapped(sender: UIButton) {
        changePickerRow(btPopular4Title!)
        changeButtonTapped(sender)
    }
    
    //Check if TextField was changed, to searh every char typed
    func textFieldDidChange(textField: UITextField) {
        changePickerRow(tfSearch.text)
    }
    
    //Change the button tapped, border OFF in previous button tapped, border ON in current Button tapped
    func changeButtonTapped(button : UIButton){
        buttonTapped?.layer.borderWidth = 0
        buttonTapped?.layer.borderColor = nil
        button.layer.borderWidth = 3
        button.layer.borderColor = blueColor.CGColor
        buttonTapped = button
    }
    func changeButtonInicialTapped(button : UIButton){
        buttonTapped?.layer.borderWidth = 0
        buttonTapped?.layer.borderColor = nil
        buttonTapped = button
    }
    
    //change the selected row in Picker with one Subject if it is finded
    func changePickerRow(subject: String){
        let response = findSubject(subject)
        if response[0] != -1 {
            picker.selectRow(response[1], inComponent: 0, animated: true)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject()! as UITouch
        let location = touch.locationInView(view)
        if buttonTapped != nil {
            changeButtonInicialTapped(buttonTapped!)
        }
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
}

//extension to check if Strings contains Another
extension String {
    
    func contains(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
}

//extensiono to make Color with Hexadecimal
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
