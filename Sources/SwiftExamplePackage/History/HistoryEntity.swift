//
//  HistoryEntity.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 21.11.2022.
//

import Foundation

public struct HistoryEntity {
    var name: String
    var animeFacts: [HistoryAnimeFact]
}

public struct HistoryAnimeFact {
    var fact: String
    var factId: Int
}
