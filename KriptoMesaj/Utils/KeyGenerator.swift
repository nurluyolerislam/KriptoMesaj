//
//  KeyGenerator.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 6.11.2022.
//

import Foundation

struct KeyGenerator{
    let p: Int
    let q: Int
    var n: Int
    var totientN: Int
    var e: Int
    var d: Int
    
    init(p: Int, q: Int){
        self.p = p
        self.q = q
        self.n = p*q
        self.totientN = (p-1)*(q-1)
        self.e = KeyGenerator.generateE(totientN: self.totientN)
        self.d = KeyGenerator.generateD(e: self.e, totientN: self.totientN)
    }
    
    static func generateE(totientN: Int) -> Int{
        while true{
            let e = Int.random(in: 3..<totientN)
            if e.isPrime && totientN % e != 0{
                return e
            }
        }
    }
    
    static func generateD(e: Int, totientN: Int) -> Int{
        let remaining = e % totientN
        for d in 1..<totientN{
            if (remaining * d % totientN == 1) {
                return d
            }
        }
        return 0
    }
}
