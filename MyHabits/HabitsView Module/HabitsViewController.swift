//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Ольга Бойко on 17.02.2023.
//

import UIKit

class HabitsViewController : UIViewController {
    
    //MARK: -var-let-enum
    
    enum Constants {
        static let collectionViewCell = "DefaultCellID"
        static let progressCollectionViewCell = "ProgressCollectionViewCell"
        static let habitCollectionViewCell = "HabitCollectionViewCell"
    }
    
    private lazy var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 22, left: 16, bottom: 22, right: 16)
        return layout
    }()
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: Constants.progressCollectionViewCell)
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: Constants.habitCollectionViewCell)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.collectionViewCell)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(named: "LightGray")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: -life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: -methods
    
    private func setupUI() {
        setupNavBar()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.tintColor = UIColor(named: "Purple")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        
        let scrollNavBar = UINavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = scrollNavBar
        
        let addHabit = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        navigationItem.rightBarButtonItem = addHabit
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: view.topAnchor),
             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func addHabit() {
        let viewController = UINavigationController(rootViewController: HabitViewController())
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}

extension HabitsViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HabitsStore.shared.habits.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.progressCollectionViewCell, for: indexPath) as? ProgressCollectionViewCell
            else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewCell, for: indexPath)
                return cell
            }
            cell.layer.cornerRadius = 10
            cell.updateCell()
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.habitCollectionViewCell, for: indexPath) as? HabitCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewCell, for: indexPath)
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width - 32, height: 60)
        }
        return CGSize(width: view.frame.width - 32, height: 130)
    }
}
