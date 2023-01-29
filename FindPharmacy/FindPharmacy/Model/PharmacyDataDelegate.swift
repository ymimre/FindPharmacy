//
//  CityDataDelegate.swift
//  FindPharmacy
//
//  Created by user229720 on 22.11.2022.
//

import Foundation

protocol PharmacyDataDelegate {
    
    func cityListLoaded()
    func regionListLoaded()
    func pharmacyListLoaded()
    func pharmacyDetailLoaded(pharmacy: Pharmacy)
    
}

extension PharmacyDataDelegate {
    
    func cityListLoaded() {}
    func regionListLoaded() {}
    func pharmacyListLoaded() {}
    func pharmacyDetailLoaded(pharmacy: Pharmacy) {}
}
