//
//  DecryptionViewModel.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import Foundation

class DecryptionViewModel: ObservableObject{
    @Published var dText: String = ""
    @Published var nText: String = ""
    @Published var encryptedText: String = ""
    @Published var decryptedText: String = ""
    @Published var isShowingDecryptedText: Bool = false
    
    func decrypt(){
        
        if let d = Int(self.dText),
           let n = Int(self.nText){
            
            self.decryptedText = RSACryptography.decryptText(text: self.encryptedText,
                                                             d: d,
                                                             n: n)
            
            self.isShowingDecryptedText = true
        }
    }
}
