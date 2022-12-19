//
//  KeyGenerationView.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import SwiftUI

struct KeyGenerationView: View {
    
    @StateObject var viewModel = KeyGenerationViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            
            Spacer()
            
            TextField("Birinci asal sayı (p)", text: self.$viewModel.pText)
                .keyboardType(.numberPad)
            Divider()
                .padding(.bottom, 20)
            TextField("İkinci asal sayı (q)", text: self.$viewModel.qText)
                .keyboardType(.numberPad)
            Divider()
                .padding(.bottom, 20)
            
            Button {
                if !self.viewModel.pText.isEmpty && !self.viewModel.qText.isEmpty{
                    self.viewModel.generateKey()
                }
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .overlay {
                        HStack{
                            Image(systemName: "key.viewfinder")
                            Text("Anahtar Üret")
                        }
                        .foregroundColor(.black)
                    }
            }
            .padding(.bottom, 20)
            
            Text(self.viewModel.resultText)
                .padding(.bottom, 20)
            
            Spacer()
            
            Text("""
Not: p ve q değerleri 1'den uzak ve birbirlerine yakın olmalıdır.
p ve q' nun çarpım değeri 255'ten fazla olmalıdır.
""")
            .font(.footnote)
            .foregroundColor(.gray)
            
        }
        .padding(.horizontal)
    }
}

struct KeyGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        KeyGenerationView()
    }
}
