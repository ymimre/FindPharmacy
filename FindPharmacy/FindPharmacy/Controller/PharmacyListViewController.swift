//
//  PharmacyListViewController.swift
//  FindPharmacy
//
//  Created by user229720 on 24.11.2022.
//

import UIKit

class PharmacyListViewController: UIViewController {

    
    @IBOutlet weak var pharmacyListTableView: UITableView!
    
    private let pharmacyDataSource = PharmacyDataSource()
    var regionId: String?
    
    override func viewDidLoad() {
        self.title = "Pharmacy Selection"
        super.viewDidLoad()
        pharmacyDataSource.delegate = self
        if let regionId = regionId {
            pharmacyDataSource.getListOfPharmacies(with: regionId)
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if
            let cell = sender as? UITableViewCell,
            let indexPath = pharmacyListTableView.indexPath(for: cell),
            let pharmacyDetailViewController = segue.destination as? PharmacyDetailViewController,
            let pharmacy = pharmacyDataSource.getPharmacy(for: indexPath.row)
        {
            pharmacyDetailViewController.pharmacyId = pharmacy.Id
        }
    }
    

}

extension PharmacyListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfPharmacies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell") as? PharmacyListTableViewCell
         else{
            return UITableViewCell()
        }
         if let pharmacy = pharmacyDataSource.getPharmacy(for: indexPath.row) {
             cell.pharmacyNameLabel.text = "\(pharmacy.Name)"
         }else {
             cell.pharmacyNameLabel.text = "N/A"
         }
         return cell
    }
}
extension PharmacyListViewController: PharmacyDataDelegate {
    func pharmacyListLoaded() {
        self.pharmacyListTableView.reloadData()
    }
}
