//
//  PharmacyDetailViewController.swift
//  FindPharmacy
//
//  Created by user229720 on 24.11.2022.
//

import UIKit

class PharmacyDetailViewController: UIViewController {

    @IBOutlet weak var pharmacyDetailNameLabel: UILabel!
    @IBOutlet weak var pharmacyDetailPhoneLabel: UILabel!
    
    @IBOutlet weak var pharmacyDetailAddressText: UITextView!
    private let pharmacyDataSource = PharmacyDataSource()
    var pharmacyId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pharmacyDataSource.delegate = self
        if let pharmacyId = pharmacyId {
           pharmacyDataSource.getPharmacyDetail(with: pharmacyId)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pharmacyDetailNameLabel.text = "N/A"
        pharmacyDetailPhoneLabel.text = "N/A"
        pharmacyDetailAddressText.text = "N/A"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension PharmacyDetailViewController: PharmacyDataDelegate {
    func pharmacyDetailLoaded(pharmacy: Pharmacy) {
        pharmacyDetailNameLabel.text = "\(pharmacy.Name)"
        pharmacyDetailPhoneLabel.text = "\(pharmacy.Phone ?? "N/A")"
        pharmacyDetailAddressText.text = "\(pharmacy.Address ?? "N/A")"
    }
}

