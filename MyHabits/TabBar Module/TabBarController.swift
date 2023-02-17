//
//  TabBarController.swift
//  MyHabits
//
//  Created by Ольга Бойко on 17.02.2023.
//

import UIKit

class TabBarController : UITabBarController {
    
    //MARK: -var/-let
    //cоздаем 2 навигационных контроллера
    var firstTabController : UINavigationController!
    var secondTabController : UINavigationController!
    
    //MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: -methods
    private func setupUI() {
        //объявляем стартовый экран и задаем контрллеры
        firstTabController = UINavigationController.init(rootViewController: HabitsViewController())
        secondTabController = UINavigationController.init(rootViewController: InfoViewController())
        
        self.viewControllers = [firstTabController, secondTabController]
        
        //создаем кнопки и привязываем к ним контроллеры
        let item1 = UITabBarItem(title: "Привычки", image: UIImage(named: "habits_img"), tag: 0)
        let item2 = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), tag: 1)
        
        firstTabController.tabBarItem = item1
        secondTabController.tabBarItem = item2
        
        //кастомизация иконок
        UITabBar.appearance().tintColor = UIColor(named: "Purple")
        UITabBar.appearance().backgroundColor = UIColor(named: "TabBarGray")
    }
}
