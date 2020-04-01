//
//  ViewController.swift
//  CoreDataCloudKitpractice
//
//  Created by Eloisa Falcão on 01/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

//import UIKit
//import CloudKit
//
//class ViewController: UIViewController {
//
//    let professor = CKRecord(recordType: "Professor")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        professor.setValue("João", forKey: "nome")
//        professor.setValue(31893996, forKey: "drt")
//
//        let container = CKContainer(identifier: "iCloud.elf.CloudKitTest")
//        let dbPublica = container.publicCloudDatabase
//
//        dbPublica.save(professor) { (record, erro) in
//            if let erro = erro {
//                print(erro)
//            } else {
//                print("O aluno foi salvo")
//            }
//        }
//
//        let name2 = "Alvaro"
//        let predicado = NSPredicate(format: "Nome == %@", argumentArray: [name2])
//
//        let busca = CKQuery(recordType: "Professor", predicate: predicado)
//
//        dbPublica.perform(busca, inZoneWith: nil) { (records, erro) in
//            if let erro = erro {
//                print(erro)
//            }
//            else {
//                print(self.professor)
//                print("A busca foi executada com sucesso")
//            }
//        }
//
//    }
//}

