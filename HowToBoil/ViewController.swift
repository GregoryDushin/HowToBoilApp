//
//  ViewController.swift
//  HowToBoil
//
//  Created by Григорий Душин on 06.11.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    var timer = Timer()
    
    var percent:Double = 0.0
    
    var secondsRemaining : Int = 0
    
    @IBOutlet weak var eggLabel: UILabel!
   
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["1":0 , "2":60, "3":120,"4":180 , "5":240, "6":420,"7":450 ,"8":480, "9":540,"10":600]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 0
        
        eggLabel.text = "WAIT!"
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
      secondsRemaining = eggTimes[hardness]!
        
        percent = Double(eggTimes[hardness]!)
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter(){
        if secondsRemaining > 0 {
        print("\(secondsRemaining) seconds.")
        secondsRemaining -= 1
            progressBar.progress += Float((1/percent))
                }
        if secondsRemaining == 0 {
           
            playSound()
            
            timer.invalidate()
            
            eggLabel.text = "DONE!"
        
        }
            }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

}

