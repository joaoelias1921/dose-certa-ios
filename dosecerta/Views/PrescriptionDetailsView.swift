//
//  PrescriptionDetailsView.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import SwiftUI

struct PrescriptionDetailsView: View {
    let prescription: Prescription
    
    var body: some View {
        List {
            Section(header: Text("Medicamentos")) {
                ForEach(prescription.medicines, id: \.name) { medicine in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(medicine.name)
                            .font(.title3.bold())
                        
                        HStack {
                            Label(medicine.dosage, systemImage: "pills.fill")
                            Spacer()
                            Label(medicine.frequency, systemImage: "clock.fill")
                        }
                        .font(.subheadline)
                        
                        if !medicine.observations.isEmpty {
                            Text(medicine.observations)
                                .font(.footnote)
                                .italic()
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationTitle(prescription.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PrescriptionDetailsView(prescription: Prescription(
        id: "1234",
        name: "Receita do Dr. Alex",
        medicines: [
            Medicine(
                name: "Ibuprofeno",
                dosage: "200mg",
                frequency: "2 vezes ao dia",
                observations: "Tomar após refeição",
                timeToTake: "12:00, 00:00"
            ),
            Medicine(
                name: "Dipirona",
                dosage: "1g",
                frequency: "1 vez ao dia",
                observations: "",
                timeToTake: "12:00"
            ),
            Medicine(
                name: "Ciprofloxacino",
                dosage: "400mg",
                frequency: "1 vez ao dia",
                observations: "Tomar após refeição",
                timeToTake: "08:00"
            ),
        ],
        userId: "1",
        createdAt: "22/12/2025",
        updatedAt: "22/12/2025")
    )
}
