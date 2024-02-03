//
//  CardSelectionVC.swift
//  CardWorkOut
//
//  Created by Muhammad Umara on 03/02/2024.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "2C")
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func restartTimer() {
        stopTimer()
        startTimer()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        stopTimer()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        restartTimer()
    }
    
}
