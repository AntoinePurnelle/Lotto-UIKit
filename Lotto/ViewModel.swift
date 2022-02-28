//
//  ViewModel.swift
//  Lotto
//
//  Created by Antoine Purnelle on 25/02/2022.
//

import Foundation


struct ViewModel {
    
    var numbers = Array(1...32)
    var drawnNumbers : [Int] = Array()
    
    mutating func drawNumber() {
        drawnNumbers.append(numbers.remove(at: Int.random(in: 0..<numbers.count)))
    }
    
    mutating func resetGame() {
        numbers = Array(1...32)
        drawnNumbers = Array()
    }
    
}
