//
//  MyPrescriptionsViewModel.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

@Observable
class MyPrescriptionsViewModel {
    var prescriptions = [Prescription]()
    private var db = Firestore.firestore()
    
    func fetchPrescriptions() {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        db.collection("prescriptions")
            .whereField("userId", isEqualTo: uid)
            .order(by: "createdAt", descending: true)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error fetching prescriptions: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else { return }
                self.prescriptions = documents.compactMap { doc -> Prescription? in
                    do {
                        return try doc.data(as: Prescription.self)
                    } catch {
                        print("Error decoding document \(doc.documentID): \(error)")
                        return nil
                    }
                }
            }
    }
    
    func deletePrescription(at offsets: IndexSet) {
        offsets.forEach { index in
            let id = prescriptions[index].id ?? ""
            Firestore.firestore().collection("prescriptions").document(id).delete()
            self.prescriptions.remove(at: index)
        }
    }
    
    func signOutUser() {
        try? Auth.auth().signOut()
    }
}
