//
//  SelectPhotoViewController.swift
//  FourPay
//
//  Created by user212294 on 1/13/22.
//

import UIKit

var profilePhoto = 0

class SelectPhotoViewController: UIViewController {

    @IBOutlet weak var ivProfilePhoto: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btChoose(_ sender: Any) {
        //RegisterTableViewController().ivDefinedProfilePhoto.image = ivProfilePhoto.image
        
        
        NotificationCenter.default.post(name: Notification.Name("image"), object: ivProfilePhoto.image)
        self.navigationController?.popViewController(animated: true)
        profilePhoto = profilePhoto + 1
        
        
    }
    

}
