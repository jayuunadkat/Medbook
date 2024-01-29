//
//  CountryModel.swift
//  MedBook
//
//  Created by Jaymeen Unadkat on 27/01/24.
//

import Foundation
import SwiftUI

///`CountryData`
struct CountryData: Codable, Hashable, Equatable, Identifiable {
    let id: UUID = UUID()
    var country: String
    var region: String
    var countryCode: String? = nil
    init(
        country: String = "",
        region: String = "",
        countryCode: String? = nil
    ) {
        self.country = country
        self.region = region
        self.countryCode = countryCode
    }
}

///`GetCountries`
extension CountryData {
    static func getCountries(completion: @escaping ((_ arrCountries: [CountryData]) -> ())) {
        APIManager.makeRequest(with: "https://api.first.org/data/v1/countries", method: .get, parameter: [:]) { response in

            guard let json = response as? [String: Any] else { return }
            guard let data = try? JSONSerialization.data(withJSONObject: json["data"] as?  [String:Any] ?? [:]) else { return }

            do {
                let countryModel = try JSONDecoder().decode([String: CountryData].self, from: data)
                let arrCountries = countryModel.map({CountryData(country: $0.value.country, region: $0.value.region, countryCode: $0.value.countryCode ?? "")})
                completion(arrCountries)
            } catch let error {
                print("Error >> \(error.localizedDescription)")
            }
        } failure: { error, errorcode, isAuth in
            Alert.show(message: error)
        } connectionFailed: { error in
            Alert.show(message: error)
        }

    }
}

extension CountryData {
    ///`getCurrentCountry`
    static func getCurrentCountry(completion: @escaping ((_ currentCountry: String) -> ())) {
        APIManager.makeRequest(with: "http://ip-api.com/json", method: .get, parameter: [:]) { response in

            guard let json = response as? [String: Any] else { return }
            let country = json["country"] as? String ?? ""
            completion(country)
        } failure: { error, errorcode, isAuth in
            
            Alert.show(message: error)
        } connectionFailed: { error in
            Alert.show(message: error)
        }
    }
}
