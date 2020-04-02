//
//  TeacherTableViewCell.swift
//  CoreDataCloudKitpractice
//
//  Created by Eloisa Falcão on 02/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var drt: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
