//
//  ViewController.swift
//  Lotto
//
//  Created by Antoine Purnelle on 25/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labels: [UILabel]?
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    var vm = ViewModel()

    @IBAction func drawButton(_ sender: Any) {
        vm.drawNumber()

        updateLabel(index: vm.drawnNumbers.count - 1)

        updateButtonsStates(canPlay: vm.drawnNumbers.count != labels?.count)
    }

    @IBAction func resetButton(_ sender: Any) {
        vm.resetGame()
        resetViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        resetViews()
    }

    func updateLabel(index: Int) {
        if let number = vm.drawnNumbers[atOrNil: index], let label = labels?[index] {
            label.text = String(number)

            let isEven = (number % 2) == 0
            label.backgroundColor = isEven ? UIColor.red : UIColor.yellow
            label.textColor = isEven ? UIColor.white : UIColor.black
        }
    }

    func resetViews() {
        labels?.forEach { label in
            label.text = ""
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 24
            label.backgroundColor = UIColor.gray
        }

        updateButtonsStates(canPlay: true)
    }

    func updateButtonsStates(canPlay: Bool) {
        drawButton.isEnabled = canPlay
        resetButton.isEnabled = !canPlay
    }
}

extension Collection {
    subscript(atOrNil index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

