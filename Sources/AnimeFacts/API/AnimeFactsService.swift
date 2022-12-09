//
//  AnimeFactsService.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 20.11.2022.
//

import Foundation
import Alamofire

class AnimeFactsService {
    
    func getFactsAbout(animeName: String, completion: @escaping (SearchFactsEntity) -> Void) {
        
//        AF.request("https://anime-facts-rest-api.herokuapp.com/api/v1/\(animeName)".validate().responseData(completionHandler: { responseData in
//            switch responseData.result {
//            case .success(let value):
//                do {
//                    let animeFacts = try JSONDecoder().decode(SearchFactsEntity.self, from: value)
//                    completion(animeFacts)
//                } catch {
//                    print("Error decoding jsonData: \(error.localizedDescription)")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        })
            
        var animeFacts = [AnimeFact]()
        let testFacts = ["Namakura Gatana is the earliest surviving anime",
                         "Sazae-san is the world’s longest-running anime",
                         "Sally the Witch is the first magical girl anime",
                         "Spirited Away was the first anime to be nominated for an Oscar",
                         "The Titans in Attack on Titan are based on drunk people",
                         "If it weren’t for the creator of Dragon Ball, Bleach wouldn’t be around",
                         "Haruichi Furudate created the anime Haikyuu!! mostly to try and make volleyball more popular",
                         "50 new colors were made exclusively for the 1988 anime film Akira",
                         "Dragon Ball is among the most popular, if not the most popular, shonen anime in the world",
                         "Naruto, One Piece, and Bleach are commonly called “The Big 3”"]
        for i in 0..<10 {
            let animeFact = AnimeFact(fact_id: i+1, fact: testFacts[i])
            animeFacts.append(animeFact)
        }
        
        let anime = SearchFactsEntity(img: "", total_facts: 10, data: animeFacts)
        
        completion(anime)
    }
}
