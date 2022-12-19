//
//  RSACryptography.swift
//  KriptoMesaj
//
//  Created by Erislam Nurluyol on 8.12.2022.
//

import Foundation
struct RSACryptography{
    ///Verilen stringin karakterlerinin ascii değerlerini m^e mod(n) fonksiyonuna göre şifreler. Şifrelenmiş sayısal değerin basamak sayısı, "n" değerinin basamak değerinden az ise değerin başına "0"lar ekleyerek geri döndürür.
    static func encryptText(text: String, e: Int, n: Int)->String{
        var encryptedText = ""
        
        for character in text{
            
            if let asciiValue = character.asciiValue{
                
                let valueOfEncryptedChar = String(modularExponentiation(a: Int(asciiValue), b: e, n: n))
                    .leftPadding(toLength: String(n).count,
                                 withPad: "0")
                
                encryptedText.append(valueOfEncryptedChar)
            }
        }
        return encryptedText
    }
    ///Verilen stringi "n" değerinin basamak değeri uzunluğunda parçalara ayırarak, her bir parçaya c^d mod(n) fonksiyonunu uygular ve geriye dönen değerin ascii karşılığını string değişkene ekleyerek geri döndürür.
    static func decryptText(text: String, d: Int, n: Int)->String{
        var encryptedText = text
        let digitCount = String(n).count
        let range = encryptedText.index(encryptedText.startIndex, offsetBy: 0)..<encryptedText.index(encryptedText.startIndex, offsetBy: digitCount)
        var decryptedText = ""
        var tmp = ""
        var tmpIntValue = 0
        
        while encryptedText.count != 0{
            
            tmp = encryptedText.substring(with: range)
            
            tmpIntValue = modularExponentiation(a: Int(tmp)!, b: d, n: n)
            
            if let tmpChar = UnicodeScalar(tmpIntValue)?.description{
                decryptedText.append(tmpChar)
            }
            
            encryptedText.removeSubrange(range)
        }
        return decryptedText
    }
    
    ///a^b mod(n) işlemini yapan fonksiyon. (Üstel Mod İşlemi)
    static func modularExponentiation(a: Int, b: Int, n:Int) -> Int{
        var remainingValue = 1
        if b > 1{
            for _ in 0..<b{
                remainingValue = (remainingValue * a) % n
            }
        }
        return remainingValue
    }
    
}
