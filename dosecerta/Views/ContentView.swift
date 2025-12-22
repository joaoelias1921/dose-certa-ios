//
//  ContentView.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isLogged = false

    var body: some View {
        Group {
            if isLogged {
                MyPrescriptionsView()
            } else {
                WelcomeView()
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { _, user in
                withAnimation(.easeInOut) {
                    self.isLogged = (user != nil)
                }
            }
        }
    }
}
