//
//  CityDataSource.swift
//  FindPharmacy
//
//  Created by user229720 on 22.11.2022.
//

import Foundation


class PharmacyDataSource {
    
    private var cityArray: [City] = []
    private var regionArray: [Region] = []
    private var pharmacyArray: [Pharmacy] = []
    private let baseURL = "https://koc.api.staging.tarentum.io"
    var delegate: PharmacyDataDelegate?
    
    init() {
    }
    
    func getListOfCities() {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/city") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    self.cityArray = try! decoder.decode([City].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.cityListLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func getListOfRegions(with id: Int) {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/city/\(id)/region") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                if let data = data {
                    
                    let decoder = JSONDecoder()
                    self.regionArray = try! decoder.decode([Region].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.regionListLoaded()
                    }
                }
            }
                dataTask.resume()
            }
        }
    
    func getListOfPharmacies(with id: String) {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/region/\(id)/pharmacy") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    self.pharmacyArray = try! decoder.decode([Pharmacy].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.pharmacyListLoaded()
                    }
                }
            }
                dataTask.resume()
            }
        }
    
    func getPharmacyDetail(with id: String) {
        print(id)
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/pharmacy/\(id)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                print(23)
                if let data = data {
                    print(String(decoding: data, as: UTF8.self))
                    print(data)
                    let decoder = JSONDecoder()
                    let pharmacy = try! decoder.decode(Pharmacy.self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.pharmacyDetailLoaded(pharmacy: pharmacy)
                    }
                }
            }
                dataTask.resume()
            }
        }
    
    func getNumberOfCities() -> Int {
        return cityArray.count
    }
    
    func getNumberOfRegions() -> Int {
        return regionArray.count
    }
    
    func getNumberOfPharmacies() -> Int {
        return pharmacyArray.count
    }
    
    func getCity(for index: Int) -> City? {
        guard index < cityArray.count
        else {
            return nil
        }
        
        return cityArray[index]
    }
    
    func getRegion(for index: Int) -> Region? {
        guard index < regionArray.count
        else {
            return nil
        }
        
        return regionArray[index]
    }
    
    func getPharmacy(for index: Int) -> Pharmacy? {
        guard index < pharmacyArray.count
        else {
            return nil
        }
        
        return pharmacyArray[index]
    }
}
