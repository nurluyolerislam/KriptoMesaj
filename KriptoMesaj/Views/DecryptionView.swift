//
//  DecryptionView.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import SwiftUI

struct DecryptionView: View {
    
    @StateObject var viewModel = DecryptionViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            
            TextField("Kapalı anahtar d değeri", text: self.$viewModel.dText)
                .keyboardType(.numberPad)
            Divider()
                .padding(.bottom, 20)
            
            TextField("Kapalı anahtar n değeri", text: self.$viewModel.nText)
                .keyboardType(.numberPad)
            Divider()
                .padding(.bottom, 20)
            
            TextField("Çözmek İstediğiniz Metni Giriniz", text: self.$viewModel.encryptedText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Spacer()
            
            Button {
                self.viewModel.decrypt()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .overlay {
                        HStack{
                            Image(systemName: "envelope.open.fill")
                            Text("Metni Çöz")
                        }
                        .foregroundColor(.black)
                    }
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: self.$viewModel.isShowingDecryptedText) {
            VStack(spacing: 20){
                
                Text("Çözülmüş Metin")
                    .padding(.top, 10)
                ScrollView(showsIndicators: true){
                    Text(self.viewModel.decryptedText)
                }
                
                Button {
                    UIPasteboard.general.string = self.viewModel.decryptedText
                } label: {
                    Text("Metni Kopyala")
                }
            }
            .padding()
        }
    }
}

struct DecryptionView_Previews: PreviewProvider {
    static var previews: some View {
        DecryptionView()
    }
}
