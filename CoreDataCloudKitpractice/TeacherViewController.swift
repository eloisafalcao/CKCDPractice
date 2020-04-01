//
//  TeacherViewController.swift
//  CoreDataCloudKitpractice
//
//  Created by Eloisa Falcão on 01/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit
import CloudKit

class TeacherViewController: UIViewController {

    @IBOutlet weak var teacherPhoto: UIImageView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var teacherDRT: UILabel!
    var professor = [CKRecord]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        let record = CKRecord(recordType: "Professor")
        CKManager.shared.fetchData(record: record, argumentArray: ["João"]) { (answer) in
            switch answer {
            case .fail(let err, _):
                print(err)
            case .successful(let results):
                for result in results {
                    self.professor.append(result)
                    result.
                }
            }
        }
    }

    func setup(professor: CKRecord) {
        teacherName.text
        teacherName.setNeedsDisplay()
        teacherDRT.setNeedsDisplay()

    }
}
