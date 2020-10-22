//
//  Paquet.swift
//  Cartes
//
//  Created by sg812131 on 12/10/2020.
//  Copyright © 2020 Guillaume Savin. All rights reserved.
//

import Foundation

class Paquet : Collection, CustomStringConvertible {
    
    var cartes : Array<Carte>
    typealias Element = Carte
    typealias Index = Int
    
    var nombre : Int {
        return cartes.count

    }
    var description : String {

        var str = ""
            
        for carte in cartes {
            str += "\(carte) "
        }
        
        return str
    }
    
    static var jeuComplet : Paquet {
        
        var newDeck = Paquet()
        
        for carte : Carte in "2♣️"..."A♠️"{
            newDeck.cartes.append(carte)
        }
        
        return newDeck
    }
    
    
    
    var startIndex: Int = 0
    
    var endIndex: Int {
        return nombre
    }
    
    init() {
        self.cartes = [Carte]()
    }
    
    init(tab: Array<Carte>) {
        self.cartes = tab
    }
    
    subscript(indice: Int) -> Carte {
        return self.cartes[indice]
    }
    
    func ajouteDessus(c: Carte){
        self.cartes.append(c)
    }
    
    func enleveDessus() -> Carte? {
        let backup = self.cartes.last
        
        self.cartes.removeLast()
        
        return backup
    }
    
    func ajouteDessous(p: Paquet) {
        let backup = self.cartes
        
        self.cartes = p.cartes
        
        for carte in backup {
            ajouteDessus(c: carte)
        }
    }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    func melange() {
        self.cartes.shuffle()
    }
}
