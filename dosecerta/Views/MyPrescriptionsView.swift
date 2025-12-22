//
//  MyPrescriptionsView.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import SwiftUI

struct MyPrescriptionsView: View {
    @State private var viewModel = MyPrescriptionsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color(uiColor: .systemGroupedBackground)
                        .ignoresSafeArea()
                
                List(viewModel.prescriptions) { prescription in
                    NavigationLink(destination: PrescriptionDetailsView(prescription: prescription)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(prescription.name)
                                .font(.headline)
                            
                            Text("Criada em: \(prescription.createdAt)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }

                NavigationLink(destination: NewPrescriptionView()) {
                    Image(systemName: "plus")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("Minhas receitas")
            .background(.red)
            .onAppear {
                viewModel.fetchPrescriptions()
            }
        }
    }
}

#Preview {
    MyPrescriptionsView()
}
