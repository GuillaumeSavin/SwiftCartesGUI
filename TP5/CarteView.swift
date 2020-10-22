//
//  CarteView.swift
//  TP5
//
//  Created by Guillaume Savin on 22/10/2020.
//

import Cocoa

class CarteView: NSView {

    var carte : Carte = Carte(stringLiteral: "2♣️")
    var estAffichée : Bool = false
    var estGelée : Bool = false
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let imageCarte : NSImage
        let firstRect : NSRect = NSRect(x: 0, y: 0, width: self.frame.width, height:
                                        self.frame.height)
        let imageRect : NSRect
        if !estAffichée {
            imageCarte = NSImage(named: "dos")!
            imageRect = NSRect(x: 0, y: 0, width: imageCarte.size.width, height: imageCarte.size.height)
        } else {
            imageCarte = NSImage(named: "cartes")!
            imageRect = 
        }
        
        draw(firstRect, imageRect, NSCompositingOperation.copy, 1)
        

        // Drawing code here.
    }
    
}
