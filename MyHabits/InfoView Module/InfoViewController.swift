//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Ольга Бойко on 17.02.2023.
//

import UIKit

class InfoViewController : UIViewController {
    
    //MARK: -var-let
    
    let dataSource = infoModel()
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView : UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Привычка за 21 день"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var textView : UITextView = {
        let textView = UITextView(frame: .zero)
        textView.text = dataSource.text
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textView.textColor = .black
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.contentMode = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavBar()
        setupViews()
        setupConstraints()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Информация"
        
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        
        let scrollNavBar = UINavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = scrollNavBar
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

             contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
             contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
             
             titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
             titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

             textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
             textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
