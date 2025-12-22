//
//  WelcomeView.swift
//  dosecerta
//
//  Created by João Elias Cândido Reis on 22/12/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                welcomeLogo
                Spacer()
                Text("Bem vindo ao DoseCerta!")
                    .bold()
                    .font(.title)
                Text("Seu assistente pessoal para gerenciamento de receitas. Vamos te ajudar a cuidar melhor da sua saúde centralizando os detalhes dos seus medicamentos em um só lugar")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.top, 8)
                    .padding(.bottom, 56)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: AuthView()) {
                    Text("Vamos lá")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
            .padding(.top, 80)
            .frame(maxWidth: .infinity)
        }
    }
}

@ViewBuilder
private var welcomeLogo: some View {
    VStack {
        Image(.doseCertaLogo)
            .resizable()
            .scaledToFit()
            .frame(width: 160)
        Text("DoseCerta")
            .font(.title)
            .bold().foregroundColor(.blue)
    }
}

#Preview {
    WelcomeView()
}
