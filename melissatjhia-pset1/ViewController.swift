//
//  ViewController.swift
//  melissatjhia-pset1
//
//  Created by Melissa Tjhia on 31-10-16.
//  Copyright © 2016 Melissa Tjhia. All rights reserved.

// Mr. Potato Head application

import UIKit

class ViewController: UIViewController {
    
    // Images of Mr. Potato Head's parts
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
    
    // Switches of Mr. Potato Head's parts
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
    
    // Button to save image
    @IBOutlet weak var buttonSave: UIButton!
    
    // View with Mr. Potato Head
    @IBOutlet weak var viewPotatoHead: UIView!
    
    // Array with the relations between the switches and the images
    var switchImageRelations = [String : UIImageView!]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Relations between the switches and the images
       switchImageRelations = [switchArms.restorationIdentifier!: imageArms, switchEars.restorationIdentifier!: imageEars, switchEyebrows.restorationIdentifier!: imageEyebrows, switchEyes.restorationIdentifier!: imageEyes, switchGlasses.restorationIdentifier!: imageGlasses, switchHat.restorationIdentifier!: imageHat, switchMouth.restorationIdentifier!: imageMouth, switchMustache.restorationIdentifier!: imageMustache, switchNose.restorationIdentifier!: imageNose, switchShoes.restorationIdentifier!: imageShoes]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     Changes the visibility of the parts when switched is touched, depending on if the switch is turned on or off.
     */
    @IBAction func changeParts(_ sender: UISwitch!) {
        switchImageRelations[sender.restorationIdentifier!]!.isHidden = !sender.isOn
    }
    
    /**
     Save the image of Mr. Potato Head.
     Source rendering: https://www.hackingwithswift.com/example-code/media/how-to-render-a-uiview-to-a-uiimage
     */
    @IBAction func saveImage(_ sender: Any) {
        // Render the view to an image that can be saved.
        let renderer = UIGraphicsImageRenderer(size: viewPotatoHead.bounds.size)
        let image = renderer.image { ctx in
            viewPotatoHead.drawHierarchy(in: viewPotatoHead.bounds, afterScreenUpdates: true)
        }
        // Save image to cameraroll.
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(checkIfSaved(_:savingError:contextInfo:)), nil);
    }
    
    /**
     Checks if the saving of the image to cameraroll has succeeded or failed.
     Shows corresponding alert.
    Source: https://www.hackingwithswift.com/example-code/media/uiimagewritetosavedphotosalbum-how-to-write-to-the-ios-photo-album
    */
    func checkIfSaved(_ image: UIImage, savingError error: NSError?, contextInfo: UnsafeRawPointer) {
        // If saving failed to save.
        if let failed = error {
            let alertController = UIAlertController(title: "Failed to save image to cameraroll", message: failed.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default))
            present(alertController, animated: true)
        // If saving succeeded to save.
        } else {
            let alertController = UIAlertController(title: "Succeeded", message: "Image has been saved to cameraroll", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default))
            present(alertController, animated: true)
        }
    }

}

