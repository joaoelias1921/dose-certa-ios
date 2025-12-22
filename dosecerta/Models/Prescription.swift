//
//  Prescription.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import Foundation
import FirebaseFirestore

struct Prescription: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var medicines: [Medicine]
    var userId: String
    var createdAt: String
    var updatedAt: String
}
