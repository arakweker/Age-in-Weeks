//
//  ViewController.swift
//  Age in Weeks
//
//  Created by Jan van Arkel on 26-04-15.
//  Copyright (c) 2015 Jan van Arkel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dateSelection: UIDatePicker!
    @IBOutlet weak var componentLabel: UILabel!
    @IBOutlet weak var nrOfDays: UILabel!
    @IBOutlet weak var shortHand: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myCalculatieButtonPressed(sender: AnyObject) {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        var strDate = dateFormatter.stringFromDate(dateSelection.date)
        ageLabel.text = "Birthday: " + strDate
        
        var calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        var toDay = NSDate()
        var durationDateComponets = calendar!.components(NSCalendarUnit.CalendarUnitDay,
            fromDate: dateSelection.date,
            toDate: toDay,
            options: nil)
        
        var daysAlive = durationDateComponets.day
        var weeksAlive = Int(daysAlive / 7)
        var someDays = daysAlive - (weeksAlive * 7)
        
        componentLabel.text = "Alive for: \(weeksAlive) weeks and \(someDays) days"
        nrOfDays.text = "Alive for: \(daysAlive) days"
        shortHand.text = "Alive for: \(weeksAlive)w\(someDays)d"
        ageLabel.hidden = false
        componentLabel.hidden = false
        nrOfDays.hidden = false
        shortHand.hidden = false
    }
}

