//
//  CoreDataManager.swift
//  Sfera
//
//  Created by Афанасьев Александр Иванович on 21.11.2022.
//

import Foundation
import CoreData

internal class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: - Core Data stack
    
    var persistentContainer: NSPersistentContainer = {
        guard let modelURL = Bundle.module.url(forResource: "Sfera", withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL) else {
            return NSPersistentContainer()
        }
        let container = NSPersistentCloudKitContainer(name: "Sfera", managedObjectModel: model)
        container.loadPersistentStores { (storeDescription, error)in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveToCoreData(animeName: String, animeFact: AnimeFact) {
        let context = persistentContainer.viewContext
        
        do {
            let factEntityDescription = NSEntityDescription.entity(forEntityName: "Fact", in: context)
            let factObject = Fact(entity: factEntityDescription!, insertInto: context)
            factObject.fact = animeFact.fact
            factObject.factId = Int64(animeFact.fact_id)
            
            let results = try context.fetch(Anime.fetchRequest())
            for result in results {
                if result.name == animeName {
                    var animeFacts = result.animeFacts
                    for fact in animeFacts {
                        if animeFact.fact_id == fact.factId {
                            return
                        }
                    }
                    animeFacts.update(with: factObject)
                    result.setValue(animeFacts, forKey: "animeFacts")
                    saveContext()
                    return
                }
            }
            let animeEntityDescription = NSEntityDescription.entity(forEntityName: "Anime", in: context)
            let animeObject = Anime(entity: animeEntityDescription!, insertInto: context)
            animeObject.name = animeName
            animeObject.addToAnimeFacts(factObject)
            saveContext()
            
        } catch {
            print(error.localizedDescription)
        }

    }
    
    func fetchAnime(completion: @escaping ([HistoryEntity]) -> Void) {
        let context = persistentContainer.viewContext
        var allAnime = [Anime]()
        var allAnimeProcessed = [HistoryEntity]()
        do {
            allAnime = try context.fetch(Anime.fetchRequest())
            for anime in allAnime {
                var animeFacts = [HistoryAnimeFact]()
                for fact in anime.animeFacts {
                    animeFacts.append(HistoryAnimeFact(fact: fact.fact ?? "", factId: Int(fact.factId)))
                }
                allAnimeProcessed.append(HistoryEntity(name: anime.name ?? "", animeFacts: animeFacts))
            }
            completion(allAnimeProcessed)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
