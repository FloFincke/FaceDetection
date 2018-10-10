//
//  INVExampleViewController.swift
//  FaceDetection
//
//  Created by Krzysztof Kryniecki on 2/17/17.
//  Copyright © 2017 InventiApps. All rights reserved.
//

import UIKit
import AVFoundation
final class INVExampleViewController: UIViewController {
    private var videoComponent: INVVideoComponent?
    
    private var green: CGColor = UIColor.green.withAlphaComponent(0.5).cgColor
    private var red: CGColor = UIColor.red.withAlphaComponent(0.5).cgColor
    private var transparent: CGColor = UIColor.white.withAlphaComponent(0).cgColor
    
    private var active: CGColor = UIColor.white.withAlphaComponent(0).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.videoComponent = INVVideoComponent(
            atViewController: self,
            cameraType: .back, //alternative .front
            withAccess: .video
        )
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.videoComponent?.startLivePreview()
    }
    
    @IBAction func green(_ sender: Any) {
        if(self.active === self.green || self.active === self.red) {
            self.active = self.transparent
        } else {
            self.active = self.green
        }
        
        self.videoComponent!.setColor(color: self.active)
    }
    
    @IBAction func red(_ sender: Any) {
        if(self.active === self.green || self.active === self.red) {
            self.active = self.transparent
        } else {
            self.active = self.red
        }
        
        self.videoComponent!.setColor(color: self.active)
    }
}
