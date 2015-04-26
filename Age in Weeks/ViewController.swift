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
        ageLabel.text = "Birthdate: " + strDate
        
        var calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        var toDay = NSDate()
        var durationDateComponets = calendar!.components(NSCalendarUnit.CalendarUnitDay,
            fromDate: dateSelection.date,
            toDate: toDay,
            options: nil)
        
        var aantalDagenInLeven = durationDateComponets.day
        var aantalWekenInLeven = Int(aantalDagenInLeven / 7)
        var restDagen = aantalDagenInLeven - (aantalWekenInLeven * 7)
        
        componentLabel.text = "Alive for \(aantalWekenInLeven) weeks and \(restDagen) days"
        nrOfDays.text = "Alive for \(aantalDagenInLeven) days"
        ageLabel.hidden = false
        componentLabel.hidden = false
        nrOfDays.hidden = false
    }
}

