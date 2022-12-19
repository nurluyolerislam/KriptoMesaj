//
//  EncryptionViewModel.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import Foundation

class EncryptionViewModel: ObservableObject{
    @Published var eText: String = ""
    @Published var nText: String = ""
    @Published var plainText: String = ""
    @Published var encryptedText: String = ""
    @Published var isShowingEncryptedText: Bool = false
    
    func encrypt(){
        
        if let e = Int(self.eText),
           let n = Int(self.nText){
            self.encryptedText = RSACryptography.encryptText(text: self.plainText,
                                                             e: e,
                                                             n: n)
            self.isShowingEncryptedText = true
        }
        
    }
}
