//
//  Extensions.swift
//  Concentration-Game
//
//  Created by Husayn Hakeem on 1/27/18.
//  Copyright © 2018 HusaynHakeem. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
