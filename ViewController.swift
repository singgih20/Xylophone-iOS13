//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?

    @IBOutlet weak var buttonC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(resource: sender.titleLabel?.text)
            sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.alpha = 1
        }
    }
    
    func playSound(resource: String?) {
        if let soundURL = Bundle.main.url(forResource: resource, withExtension: "wav") {
                   do {
                       // Inisialisasi AVAudioPlayer
                       audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                       audioPlayer?.prepareToPlay()
                   } catch {
                       print("Error saat memuat file audio: \(error.localizedDescription)")
                   }
               }
        audioPlayer?.play()
    }
}

