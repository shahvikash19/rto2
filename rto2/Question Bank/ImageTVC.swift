//
//  ImageTVC.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit

class ImageTVC: UITableViewCell {

    @IBOutlet weak var viewQ2: UIView!
    @IBOutlet weak var imglabel: UILabel!
    @IBOutlet weak var imageviewQ: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewQ2.layer.cornerRadius = 5
        viewQ2.layer.borderColor = UIColor.red.cgColor
        viewQ2.layer.borderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
