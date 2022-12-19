//
//  ContentView.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 6.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20){
            NavigationLink {
                KeyGenerationView()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .overlay {
                        HStack{
                            Image(systemName: "key")
                            Text("Anahtar Üretimi")
                        }
                        .foregroundColor(.black)
                    }
            }
            
            NavigationLink {
                EncryptionView()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .overlay {
                        HStack{
                            Image(systemName: "envelope.badge.shield.half.filled")
                            Text("Mesaj Şifreleme")
                        }
                        .foregroundColor(.black)
                    }
            }
            
            NavigationLink {
                DecryptionView()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .overlay {
                        HStack{
                            Image(systemName: "envelope.open.fill")
                            Text("Şifreli Mesaj Çözme")
                        }
                        .foregroundColor(.black)
                    }
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
