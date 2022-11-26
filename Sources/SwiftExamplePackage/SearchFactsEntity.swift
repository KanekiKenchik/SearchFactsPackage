//
//  AnimeFactsEntity.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 20.11.2022.
//

import Foundation

public struct SearchFactsEntity: Codable {
    public var img: String
    public var total_facts: Int
    public var data: [AnimeFact]
}

public struct AnimeFact: Codable {
    public var fact_id: Int
    public var fact: String
}
