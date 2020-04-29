//
//  ViewController.swift
//  VirusTracker
//
//  Created by Neil Hiddink on 4/28/20.
//  Copyright © 2020 Neil Hiddink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78.0
    }
    
    // MARK: - Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell") as? FlagCell {
            cell.countryNameLabel?.text = "United States"
            cell.countryFlagLabel?.text = "🇺🇸"
            return cell
        }
        return UITableViewCell()
    }

}
