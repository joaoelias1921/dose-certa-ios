//
//  Medicine.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import Foundation
import FirebaseFirestore

struct Medicine: Codable {
    var name: String
    var dosage: String
    var frequency: String
    var observations: String
    var timeToTake: String
}
