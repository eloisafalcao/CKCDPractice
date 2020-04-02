//
//  CKDataController.swift
//  CoreDataCloudKitpractice
//
//  Created by Eloisa Falcão on 01/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import CloudKit

public enum DataFetchAnswer {
    case fail(error: CKError, description: String)
    case successful(results: [CKRecord])
}

class CKManager {
    static var shared = CKManager()

    private static let container = CKContainer(identifier: "iCloud.elf.CloudKitTest")
    private let dbPublica = container.publicCloudDatabase

    private init (){

    }

    public func fetchData(record: CKRecord, completionHandler: @escaping (DataFetchAnswer) -> Void ) {

        let recordId = record.recordID
        let recordToMatch = CKRecord.Reference(recordID: recordId, action: .none)
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: record.recordType, predicate: predicate)

        dbPublica.perform(query, inZoneWith: nil) { (results, err) in
            if let err = err as? CKError {
                DispatchQueue.main.async {
                    completionHandler(.fail(error: err, description:
                        "Erro no Query da Cloud - Fetch: \(String(describing: err))"))
                }
                return
            }

            DispatchQueue.main.async {
                completionHandler(.successful(results: results ?? []))
            }
        }
    }
}

