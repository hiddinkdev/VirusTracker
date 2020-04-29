//
//  VirusDetailViewController.swift
//  VirusTracker
//
//  Created by Neil Hiddink on 4/28/20.
//  Copyright © 2020 Neil Hiddink. All rights reserved.
//

import UIKit

class VirusDetailViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryFlagLabel: UILabel!
    
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    
    var selectedCountry: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = "\(selectedCountry.Date)"
        countryNameLabel.text = "\(selectedCountry.Country)"
        countryFlagLabel.text = convertToEmoji(str: selectedCountry.CountryCode)
        
        newConfirmedLabel.text = "\(selectedCountry.NewConfirmed)"
        totalConfirmedLabel.text = "\(selectedCountry.TotalConfirmed)"
        newDeathsLabel.text = "\(selectedCountry.NewDeaths)"
        totalDeathsLabel.text = "\(selectedCountry.TotalDeaths)"
        newRecoveredLabel.text = "\(selectedCountry.NewRecovered)"
        totalRecoveredLabel.text = "\(selectedCountry.TotalRecovered)"
    }
}
