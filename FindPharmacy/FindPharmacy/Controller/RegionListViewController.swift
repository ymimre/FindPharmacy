//
//  RegionListViewController.swift
//  FindPharmacy
//
//  Created by user229720 on 24.11.2022.
//

import UIKit

class RegionListViewController: UIViewController {

    @IBOutlet weak var regionListCollectionView: UICollectionView!
    
    private let pharmacyDataSource = PharmacyDataSource()
    var cityId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Region Selection"
        pharmacyDataSource.delegate = self
        if let cityId = cityId {
            pharmacyDataSource.getListOfRegions(with: cityId)
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if
            let cell = sender as? UICollectionViewCell,
            let indexPath = regionListCollectionView.indexPath(for: cell),
            let pharmacyListViewController = segue.destination as? PharmacyListViewController,
            let region = pharmacyDataSource.getRegion(for: indexPath.row)
        {
            pharmacyListViewController.regionId = region.Id
        }
    }
    

}
extension RegionListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfRegions()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegionCell", for: indexPath) as? RegionListCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        
        if let region = pharmacyDataSource.getRegion(for: indexPath.row) {
            cell.regionNameLabel.text = "\(region.Name)"
        }else {
            cell.regionNameLabel.text = "N/A"
        }
        return cell
    }
}

extension RegionListViewController: PharmacyDataDelegate {
    func regionListLoaded() {
        self.regionListCollectionView.reloadData()
    }
}
