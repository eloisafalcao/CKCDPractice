//
//  TeacherListViewController.swift
//  CoreDataCloudKitpractice
//
//  Created by Eloisa Falcão on 02/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit
import CloudKit

class TeacherListViewController: UIViewController {

    var teachers = [CKRecord]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        let record = CKRecord(recordType: "Professor")
        CKManager.shared.fetchData(record: record) { (answer) in
            switch answer {
            case .fail(let err, _):
                print(err)
            case .successful(let results):
                self.teachers = results
                self.tableView.reloadData()
            }
        }
    }
}

extension TeacherListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherTableViewCell") as? TeacherTableViewCell
        cell?.name.text = teachers[indexPath.row].object(forKey: "nome") as? String
        cell?.drt.text = teachers[indexPath.row].object(forKey: "drt") as? String
        return cell ?? TeacherTableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TeacherViewController()
        self.present(vc, animated: true)
        vc.teacher = self.teachers[indexPath.row]
    }
}
