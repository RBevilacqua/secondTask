//
//  ViewController.swift
//  secondtask
//
//  Created by Office-UpperSky-Hackintosh on 28/05/15.
//  Copyright (c) 2015 Jv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btSearch: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var btPopular1: UIImageView!
    @IBOutlet weak var btPopular2: UIImageView!
    @IBOutlet weak var btPopular3: UIImageView!
    @IBOutlet weak var btPopular4: UIImageView!
    
    var data = [["id":1,"name":"Accounting"],["id":2,"name":"Art & Design"],["id":3,"name":"Biology"],["id":4,"name":"Business & Finance"],["id":5,"name":"Calculus"],["id":6,"name":"Chemistry"],["id":7,"name":"Economics"],["id":8,"name":"Engineering"],["id":9,"name":"English"],["id":10,"name":"Environmental Science"],["id":10,"name":"Foreign Languages"],["id":11,"name":"Geology"],["id":12,"name":"Health & Medical"],["id":13,"name":"History"],["id":14,"name":"Law"],["id":15,"name":"Marketing"],["id":16,"name":"Mathematics"],["id":17,"name":"Philosophy"],["id":18,"name":"Physics"],["id":19,"name":"Political Science"],["id":20,"name":"Computer Science"],["id":21,"name":"Psychology"],["id":22,"name":"Science"],["id":23,"name":"Social Science"],["id":24,"name":"Sociology"],["id":25,"name":"Statistics"],["id":26,"name":"Writing"],["id":27,"name":"Other"],["id":28,"name":"Algebra"],["id":29,"name":"Programming"],["id":30,"name":"Communications"],["id":31,"name":"Film"],["id":32,"name":"Management"],["id":33,"name":"SAT"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(data[0])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

