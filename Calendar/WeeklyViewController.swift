//
//  WeeklyViewController.swift
//  Calendar
//
//  Created by 정구열 on 03/11/2018.
//  Copyright © 2018 guyeol_jeong. All rights reserved.
//

import UIKit
import RealmSwift

class WeeklyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var yearLabel: UILabel!
  var selectedIdx = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    yearLabel.text = "\(year) 년"
    print(Realm.Configuration.defaultConfiguration.fileURL!)
  }
  
  @IBAction func backBtn(_ sender: Any) {
    day-=7
    if day <= 0 {
      month-=1
      if month < 0 {
        month = 11
        year -= 1
      }
      day = DaysInMonth[month] + day
    }
    tableView.reloadData()
  }
  @IBAction func nextBtn(_ sender: Any) {
    day+=7
    if day > DaysInMonth[month] {
      day -= DaysInMonth[month]
      month += 1
      if month > 11 {
        month = 0
        year += 1
      }
    }
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! TableViewCell
    if day + indexPath.row > DaysInMonth[month] {
      if month + 1 > 11 {
        cell.DateLabel?.text = "1 / \(day + indexPath.row - DaysInMonth[11])"
      } else {
        cell.DateLabel?.text = "\(month + 2) / \(day + indexPath.row - DaysInMonth[month])"
      }
      
    } else {
      cell.DateLabel?.text = "\(month+1) / \(day + indexPath.row)"
    }
    cell.TextField?.text = "스케쥴이 없습니다."
    
    return cell
  }
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    self.tabBarController?.selectedIndex = 2
  }
}
