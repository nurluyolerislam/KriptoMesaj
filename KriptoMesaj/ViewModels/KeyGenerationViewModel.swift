//
//  KeyGenerationViewModel.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import Foundation

class KeyGenerationViewModel: ObservableObject{
    @Published var pText: String = ""
    @Published var qText: String = ""
    @Published var resultText: String = ""
    
    func generateKey(){
        
        if let p = Int(self.pText),
           let q = Int(self.qText){
            if p.isPrime && q.isPrime{
                if (p*q) >= 255{
                    let key = KeyGenerator(p: p, q: q)
                    
                    self.resultText = """
Açık Anahtar: (e: \(key.e), n: \(key.n))
Özel Anahtar: (d: \(key.d), n: \(key.n))
"""
                } else {
                    self.resultText = "p*q değeri 255'ten yüksek olmalıdır."
                }
            } else {
                self.resultText = "p ve q asal sayı olmalıdır."
            }
        } else {
            self.resultText = "p ve q numerik değerler olmalıdır."
        }
    }
}
