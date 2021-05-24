//
//  GeneralQuestionsCell.swift
//  Studentor
//
//  Created by Еркебулан on 17.05.2021.
//

import UIKit

class GeneralQuestionsCell: UITableViewCell {
    public static let identifier: String = "GeneralQuestionsCell"
    @IBOutlet weak var contentViewChange: UIView!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewChange.layer.cornerRadius = 8
        contentViewChange.layer.masksToBounds = true
    }
    
}
