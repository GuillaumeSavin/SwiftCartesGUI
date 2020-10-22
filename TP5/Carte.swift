//
//  Carte.swift
//  Cartes
//
//  Created by Guillaume Savin on 05/10/2020.
//  Copyright © 2020 Guillaume Savin. All rights reserved.
//

import Foundation

struct Carte {
    enum Valeur : Int, CustomStringConvertible {
        
        case deux = 0, trois, quatre, cinq, six, sept, huit, neuf, dix, valet, dame, roi, `as`
        var description : String{
            switch self {
            case .`as`:
                return "A"
            case .deux:
                return "2"
            case .trois:
                return "3"
            case .quatre:
                return "4"
            case .cinq:
                return "5"
            case .six:
                return "6"
            case .sept:
                return "7"
            case .huit:
                return "8"
            case .neuf:
            	return "9"
            case .dix:
                return "T"
            case .valet:
                return "J"
            case .dame:
                return "Q"
            case .roi:
            	return "K"
            }
        }
    }
    
    enum Couleur : Int, CustomStringConvertible{
        case TREFLE = 0
        case CARREAU = 1
        case COEUR = 2
        case PIQUE = 3

        var description : String {
            switch self {
            case .TREFLE:
                return "♣️"
            case .CARREAU:
                return "♦️"
            case .COEUR:
                return "♥️"
            case .PIQUE:
                return "♠️"
            }
        }
    }
    let rawValue : Int
    let couleur : Couleur
    let valeur : Valeur
    
    init(val: Valeur = Valeur.`as`, coul: Couleur = Couleur.COEUR) {
        
        self.valeur = val
        self.couleur = coul
        switch val {
        case .`as`:
            self.rawValue = (coul.rawValue * 13 + 12)
        case .valet:
            self.rawValue = (coul.rawValue * 13 + 9)
        case .dame:
            self.rawValue = (coul.rawValue * 13 + 10)
        case .roi:
        	self.rawValue = (coul.rawValue * 13 + 11)
        default:
            self.rawValue = (coul.rawValue * 13 + Int(val.rawValue))
        }
    }
    
    init?(raw: Int) {
        if(raw < 0 || raw > 51) {
            return nil
        }
        let newColor : Int
        let newValue : Int
        let newCard : Carte
        
        newColor = raw / 13
        newValue =  raw % 13
        newCard = Carte(val: Carte.Valeur(rawValue: newValue)!, coul: Carte.Couleur(rawValue: newColor)!)
        self.couleur = newCard.couleur
        self.valeur = newCard.valeur
        self.rawValue = newCard.rawValue
        
    }
    
    var estUneFigure : Bool {
        if self.rawValue >= 11 && self.rawValue <= 14 {
            return true
        } else {
            return false
        }
    }
}

extension Carte : CustomStringConvertible {
    var description: String {
        return "\(valeur)\(couleur)"
    }
}

extension Carte : Comparable {
    static func < (left: Carte, right: Carte) -> Bool {
        if left.rawValue > right.rawValue {
            return false
        } else {
            return true
        }
    }
}

extension Carte : Strideable {
    func advanced(by n:Int) -> Carte {
        return Carte(raw: (self.rawValue + n))!
    }
    func distance(to other: Carte) -> Int {
        return abs(self.rawValue - other.rawValue)
    }
}

extension Carte : ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        let newCard : Carte
        let temp = stringLiteral[stringLiteral.startIndex]
        let temp2 = stringLiteral[stringLiteral.index(after: stringLiteral.startIndex)]
        let value : Int
        let color : Int
        
        switch temp {
        case "A":
            value = 12
        case "K":
            value = 11
        case "Q":
            value = 10
        case "J":
            value = 9
        default:
            value = Int(String(temp))! - 2
        }
        
        switch temp2 {
        case "♣️":
            color = 0
        case "♦️":
            color = 1
        case "♥️":
            color = 2
        case "♠️":
            color = 3
        default:
            color = 0
        }
        
        newCard = Carte(val: Carte.Valeur(rawValue: value)! , coul: Carte.Couleur(rawValue: color)!)
        self.valeur = newCard.valeur
        self.couleur = newCard.couleur
        self.rawValue = newCard.rawValue
    }
}
