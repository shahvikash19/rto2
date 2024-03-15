//
//  QuestionssTVC.swift
//  rto2
//
//  Created by Vikas Hareram Shah on 20/12/23.
//

import UIKit

class QuestionssTVC: UITableViewCell {
    @IBOutlet weak var viewQ: UIView!
    @IBOutlet weak var labelQ1: UILabel!
    
    @IBOutlet weak var labelQ2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewQ.layer.cornerRadius = 5
        viewQ.layer.borderColor = UIColor.black.cgColor
        viewQ.layer.borderWidth = 2
        viewQ.backgroundColor = UIColor.orange
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
