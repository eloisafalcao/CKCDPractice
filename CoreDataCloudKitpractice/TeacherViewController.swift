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

    var teacher: CKRecord?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let teacher = teacher else { return }
        CKManager.shared.fetchData(record: teacher) { (answer) in
            switch answer {
            case .fail(let err, _):
                print(err)
            case .successful(let results):
                self.setup(result: results[0])
            }
        }
    }

    func setup(result: CKRecord) {
//        print(teacher.object(forKey: "nome") as? String)
        teacherName.text = result.object(forKey: "nome") as? String
        teacherDRT.text = result.object(forKey: "drt") as? String
    }
}
