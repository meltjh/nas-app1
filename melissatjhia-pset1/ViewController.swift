//
//  ViewController.swift
//  melissatjhia-pset1
//
//  Created by Melissa Tjhia on 31-10-16.
//  Copyright © 2016 Melissa Tjhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Images
    @IBOutlet weak var imageBody: UIImageView!
    
    @IBOutlet weak var imageEars: UIImageView!
    
    @IBOutlet weak var imageGlasses: UIImageView!
    
    @IBOutlet weak var imageHat: UIImageView!
    
    @IBOutlet weak var imageEyebrows: UIImageView!
    
    @IBOutlet weak var imageMouth: UIImageView!
    
    @IBOutlet weak var imageEyes: UIImageView!
    
    @IBOutlet weak var imageMustache: UIImageView!
    
    @IBOutlet weak var imageNose: UIImageView!
    
    @IBOutlet weak var imageShoes: UIImageView!
    
    @IBOutlet weak var imageArms: UIImageView!
    
    // Switches
    @IBOutlet weak var switchArms: UISwitch!
    
    @IBOutlet weak var switchEars: UISwitch!
    
    @IBOutlet weak var switchEyebrows: UISwitch!
    
    @IBOutlet weak var switchEyes: UISwitch!
    
    @IBOutlet weak var switchGlasses: UISwitch!
    
    @IBOutlet weak var switchHat: UISwitch!
    
    @IBOutlet weak var switchMouth: UISwitch!
    
    @IBOutlet weak var switchMustache: UISwitch!
    
    @IBOutlet weak var switchNose: UISwitch!

    @IBOutlet weak var switchShoes: UISwitch!
    
    var switchImageRelations = [String : UIImageView!]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       switchImageRelations = [switchArms.restorationIdentifier!: imageArms, switchEars.restorationIdentifier!: imageEars, switchEyebrows.restorationIdentifier!: imageEyebrows, switchEyes.restorationIdentifier!: imageEyes, switchGlasses.restorationIdentifier!: imageGlasses, switchHat.restorationIdentifier!: imageHat, switchMouth.restorationIdentifier!: imageMouth, switchMustache.restorationIdentifier!: imageMustache, switchNose.restorationIdentifier!: imageNose, switchShoes.restorationIdentifier!: imageShoes]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeParts(_ sender: UISwitch!) {
        
        switchImageRelations[sender.restorationIdentifier!]!.isHidden = !sender.isOn
    }

}

