//
//  AnimeFactsEntity.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 20.11.2022.
//

import Foundation

public struct SearchFactsEntity: Codable {
    var img: String
    var total_facts: Int
    var data: [AnimeFact]
}

public struct AnimeFact: Codable {
    var fact_id: Int
    var fact: String
}
