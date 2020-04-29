//
//  VirusViewController.swift
//  VirusTracker
//
//  Created by Neil Hiddink on 4/28/20.
//  Copyright © 2020 Neil Hiddink. All rights reserved.
//

import UIKit

class VirusViewController: UIViewController {
    
    @IBOutlet weak var newConfirmedLabel: UILabel!
    @IBOutlet weak var totalConfirmedLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var totalRecoveredLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var summary: SummaryResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VirusClient.shared.getSummaryResponse { (summary, error) in
            if let error = error { print(error.localizedDescription) }
            
            DispatchQueue.main.async {
                self.summary = summary
                
                self.newConfirmedLabel.text = "\(summary.Global.NewConfirmed)"
                self.totalConfirmedLabel.text = "\(summary.Global.TotalConfirmed)"
                self.newDeathsLabel.text = "\(summary.Global.NewDeaths)"
                self.totalDeathsLabel.text = "\(summary.Global.TotalDeaths)"
                self.newRecoveredLabel.text = "\(summary.Global.NewRecovered)"
                self.totalRecoveredLabel.text = "\(summary.Global.TotalRecovered)"
                
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndex = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndex, animated: true)
        }
    }
    
}

extension VirusViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let summary = summary else { return }
        if let detailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as? VirusDetailViewController {
            detailVC.selectedCountry = summary.Countries[indexPath.row]
            present(detailVC, animated: true)
        }
    }
    
    // MARK: - Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let summary = summary else { return 1 }
        return summary.Countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell") as? FlagCell {
            guard let summary = summary else { return UITableViewCell() }
            cell.countryNameLabel?.text = summary.Countries[indexPath.row].Country
            let code = summary.Countries[indexPath.row].CountryCode
            cell.countryFlagLabel?.text = convertToEmoji(str: code)
            return cell
        }
        return UITableViewCell()
    }

}
