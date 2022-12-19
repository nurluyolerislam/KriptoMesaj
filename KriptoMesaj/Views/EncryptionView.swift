//
//  EncryptionView.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import SwiftUI

struct EncryptionView: View {
    
    @StateObject var viewModel = EncryptionViewModel()
    
    var body: some View {
        VStack(spacing: 0){
            
            TextField("Açık anahtar e değeri", text: self.$viewModel.eText)
                .keyboardType(.numberPad)
            Divider()
                .padding(.bottom, 20)
            
            TextField("Açık anahtar n değeri", text: self.$viewModel.nText)
                .keyboardType(.numberPad)
            Divider()
                .padding(.bottom, 20)
            
            TextField("Şifrelemek İstediğiniz Metni Giriniz", text: self.$viewModel.plainText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Spacer()
            
            Text("""
Not: ASCII karşılığı olmayan karakterler kullanmayın.
Örn: ı,ğ,ü,ş,İ,ö,ç
""")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            Button {
                self.viewModel.encrypt()
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(height: 50)
                    .overlay {
                        HStack{
                            Image(systemName: "envelope.badge.shield.half.filled")
                            Text("Metni Şifrele")
                        }
                        .foregroundColor(.black)
                    }
            }

        }
        .padding(.horizontal)
        .sheet(isPresented: self.$viewModel.isShowingEncryptedText) {
            VStack(spacing: 20){
                
                Text("Şifrelenmiş Metin")
                    .padding(.top, 10)
                ScrollView(showsIndicators: true){
                    Text(self.viewModel.encryptedText)
                }
                
                Button {
                    UIPasteboard.general.string = self.viewModel.encryptedText
                } label: {
                    Text("Metni Kopyala")
                }
            }
            .padding()
        }
    }
}

struct EncryptionView_Previews: PreviewProvider {
    static var previews: some View {
        EncryptionView()
    }
}
