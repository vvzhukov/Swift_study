//
//  ViewController.swift
//  test_app
//
//  Created by Vitaly Zhukov on 02/08/2018.
//  Copyright © 2018 Vitaly Zhukov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var rocketLbl: UILabel!
    @IBOutlet weak var OnLbl: UILabel!
    @IBOutlet weak var CloudsOval: UIImageView!
    
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        rocket.isHidden = false
        rocketLbl.isHidden = false
        OnLbl.isHidden = false
        CloudsOval.isHidden = false
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 140, width: 375, height: 402)
        }) {(finished) in
            self.rocketLbl.isHidden = false
            self.OnLbl.isHighlighted = false
        }
        
    }
    

}

