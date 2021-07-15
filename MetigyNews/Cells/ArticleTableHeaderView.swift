//
//  HeaderView.swift
//  MetigyNews
//
//  Created by Tarinda on 11/7/21.
//

import UIKit

class ArticleTableHeaderView: UITableViewCell {


    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    //    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
