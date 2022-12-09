//
//  File.swift
//  
//
//  Created by Афанасьев Александр Иванович on 09.12.2022.
//

import Foundation
import UIKit

public class FinalModuleBuilder {
    public static func build() -> UIViewController {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: SearchFactsModuleBuilder.build())
        let vc2 = UINavigationController(rootViewController: HistoryModuleBuilder.build())
        tabBarVC.setViewControllers([vc1, vc2], animated: false)
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = navBarAppearance

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        }
        
        guard let items = tabBarVC.tabBar.items else { return UIViewController() }
        let images = ["magnifyingglass", "clock"]
        let titles = ["Search", "History"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
            items[i].title = titles[i]
        }
        
        return tabBarVC
    }
}
