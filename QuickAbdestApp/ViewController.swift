//
//  ViewController.swift
//  QuickAbdestApp
//
//  Created by Mustafa Çağrı Peker on 9.06.2020.
//  Copyright © 2020 Mustafa Cagri Peker. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var refreshBtn: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var changeImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    var aydinlanma: AVAudioPlayer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeImage.isUserInteractionEnabled = true
        infoLabel.isUserInteractionEnabled = true
        refreshBtn.isUserInteractionEnabled = true
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(changePic))
        changeImage.addGestureRecognizer(gestureRecognizer1)
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(changePic))
        infoLabel.addGestureRecognizer(gestureRecognizer2)
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(makeRefresh))
        refreshBtn.addGestureRecognizer(gestureRecognizer3)
    }
    
    @objc func changePic(){
        changeImage.image = UIImage(named: "happy")
        infoLabel.text = "A B D E S T L E N D İ N"
        playSound()
        infoLabel.textColor = .red
        changeImage.isUserInteractionEnabled = false
        infoLabel.isUserInteractionEnabled = false
    }
    
    @objc func makeRefresh(){
        changeImage.image = UIImage(named: "sad")
        infoLabel.text = "Abdest Almak İçin Tıklayın"
        stopSound()
        infoLabel.textColor = .black
        changeImage.isUserInteractionEnabled = true
        infoLabel.isUserInteractionEnabled = true
    }
    
    func playSound(){
        let path = Bundle.main.path(forResource: "Aydınlanma Ses Efekti.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            aydinlanma = try AVAudioPlayer(contentsOf: url)
            aydinlanma?.play()
        } catch {
            // couldn't load file :(
        }
        
    }
    
    func stopSound(){
        aydinlanma?.stop()
    }


}

