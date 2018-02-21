//
//  ViewController.swift
//  Swift-Motion
//
//  Created by gyoza manner on July 20, 2014
//  Copyright (c) 2014 gyoza manner. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // Connection with interface builder

    @IBOutlet var gyro_x: UILabel!
    @IBOutlet var gyro_y: UILabel!
    @IBOutlet var gyro_z: UILabel!

    @IBOutlet weak var x_25: UILabel!
    @IBOutlet weak var y_25: UILabel!
    @IBOutlet weak var z_25: UILabel!
    
    
    // create instance of MotionManager
    let motionManager: CMMotionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize MotionManager
        motionManager.deviceMotionUpdateInterval = 0.05 // 20Hz
        
        // Start motion data acquisition
        // motionManager.startDeviceMotionUpdatesToQueue( OperationQueue.current!, withHandler:{
        motionManager.startDeviceMotionUpdates( to:OperationQueue.current!, withHandler:{
            deviceManager, error in
            
            let gyro: CMRotationRate = deviceManager!.rotationRate
            self.gyro_x.text = String(format: "%.2f", gyro.x)
            self.gyro_y.text = String(format: "%.2f", gyro.y)
            self.gyro_z.text = String(format: "%.2f", gyro.z)
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

