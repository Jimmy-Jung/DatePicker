//
//  DateTableViewCell.swift
//  DatePicker
//
//  Created by 정준영 on 2023/07/20.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dDayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.layer.cornerRadius = 20
        blackView.layer.cornerRadius = 20
        blackView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
