//
//  ViewController.swift
//  FindPharmacy
//
//  Created by user229720 on 22.11.2022.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var cityListTableView: UITableView!

    private var pharmacyDataSource = PharmacyDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pharmacyDataSource.delegate = self
        pharmacyDataSource.getListOfCities()
        self.title = "City Selection"
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if
            let cell = sender as? UITableViewCell,
            let indexPath = cityListTableView.indexPath(for: cell),
            let regionListViewController = segue.destination as? RegionListViewController,
            let city = pharmacyDataSource.getCity(for: indexPath.row)
        {
            regionListViewController.cityId = city.Id
        }
    }

}

extension CityListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityListTableViewCell
        else{
           return UITableViewCell()
       }
        
        if let city = pharmacyDataSource.getCity(for: indexPath.row) {
            cell.cityNameLabel.text = "\(city.Name)"
        }else {
            cell.cityNameLabel.text = "N/A"
        }
        return cell
    }
}

extension CityListViewController: PharmacyDataDelegate {
    func cityListLoaded() {
        self.cityListTableView.reloadData()
    }
}
