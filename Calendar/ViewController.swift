//
//  ViewController.swift
//  Calendar
//
//  Created by 정구열 on 30/10/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let mainTabController = storyboard?.instantiateViewController(withIdentifier: "CalendarTabController") as! CalendarTabController
    present(mainTabController, animated: true, completion: nil)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

