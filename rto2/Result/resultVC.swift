//
//  resultVC.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 18/01/24.
//

import UIKit

class resultVC: UIViewController {

   
    var resRight:Int?
    var resWrong:Int?
    var pass = 30
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if pass < resRight!{
            if let image1 = UIImage(named: "Pass"){
                image.image = image1
            }
        }
        else{
            if let image2 = UIImage(named: "Failed"){
                image.image = image2
            }

        }
    }
     

    @IBAction func HMBtn(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        print("clicked")
        
    }
    
}
