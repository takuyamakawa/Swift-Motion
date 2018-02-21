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
    var lab_x25 = 0
    var lab_y25 = 0
    var lab_z25 = 0
    
    @IBOutlet weak var x_2: UILabel!
    @IBOutlet weak var y_2: UILabel!
    @IBOutlet weak var z_2: UILabel!
    var lab_x2 = 0
    var lab_y2 = 0
    var lab_z2 = 0
    
    @IBOutlet weak var x_15: UILabel!
    @IBOutlet weak var y_15: UILabel!
    @IBOutlet weak var z_15: UILabel!
    var lab_x15 = 0
    var lab_y15 = 0
    var lab_z15 = 0
    
    @IBOutlet weak var x_1: UILabel!
    @IBOutlet weak var y_1: UILabel!
    @IBOutlet weak var z_1: UILabel!
    var lab_x1 = 0
    var lab_y1 = 0
    var lab_z1 = 0

    
    @IBOutlet weak var x_05: UILabel!
    @IBOutlet weak var y_05: UILabel!
    @IBOutlet weak var z_05: UILabel!
    var lab_x05 = 0
    var lab_y05 = 0
    var lab_z05 = 0
    
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
            
            switch abs(gyro.x){
            case 0.5..<1.0:
                self.lab_x05 += 1
                self.x_05.text = String(format: "%d", self.lab_x05)
            case 1.0..<1.5:
                self.lab_x1 += 1
                self.x_1.text = String(format: "%d", self.lab_x1)
            case 1.5..<2.0:
                self.lab_x15 += 1
                self.x_15.text = String(format: "%d", self.lab_x15)
            case 2.0..<2.5:
                self.lab_x2 += 1
                self.x_2.text = String(format: "%d", self.lab_x2)
            case 2.5..<3.0:
                self.lab_x25 += 1
                self.x_25.text = String(format: "%d", self.lab_x25)
            default:
                break
            }
            
            switch abs(gyro.y){
            case 0.5..<1.0:
                self.lab_y05 += 1
                self.y_05.text = String(format: "%d", self.lab_y05)
            case 1.0..<1.5:
                self.lab_y1 += 1
                self.y_1.text = String(format: "%d", self.lab_y1)
            case 1.5..<2.0:
                self.lab_y15 += 1
                self.y_15.text = String(format: "%d", self.lab_y15)
            case 2.0..<2.5:
                self.lab_y2 += 1
                self.y_2.text = String(format: "%d", self.lab_y2)
            case 2.5..<3.0:
                self.lab_y25 += 1
                self.y_25.text = String(format: "%d", self.lab_y25)
            default:
                break
            }
            
            switch abs(gyro.z){
            case 0.5..<1.0:
                self.lab_z05 += 1
                self.z_05.text = String(format: "%d", self.lab_z05)
            case 1.0..<1.5:
                self.lab_z1 += 1
                self.z_1.text = String(format: "%d", self.lab_z1)
            case 1.5..<2.0:
                self.lab_z15 += 1
                self.z_15.text = String(format: "%d", self.lab_z15)
            case 2.0..<2.5:
                self.lab_z2 += 1
                self.z_2.text = String(format: "%d", self.lab_z2)
            case 2.5..<3.0:
                self.lab_z25 += 1
                self.z_25.text = String(format: "%d", self.lab_z25)
            default:
                break
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

