//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Ольга Бойко on 17.02.2023.
//

import UIKit

class ProgressCollectionViewCell : UICollectionViewCell {
    
    //MARK: -var-let
    private lazy var title : UILabel = {
        let title = UILabel()
        title.text = "Всё получится!"
        title.textColor = UIColor(named: "DarkGray")
        title.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var percentage : UILabel = {
        let percentage = UILabel()
        percentage.textColor = UIColor(named: "DarkGray")
        percentage.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        percentage.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        percentage.translatesAutoresizingMaskIntoConstraints = false
        return percentage
    }()
    
    private lazy var progressBar : UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.tintColor = UIColor(named: "Purple")
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    //MARK: -life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -methods
    
    private func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.addSubview(title)
        contentView.addSubview(percentage)
        contentView.addSubview(progressBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
             title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
             
             percentage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
             percentage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
             
             progressBar.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
             progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
             progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
             progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    public func updateCell() {
        progressBar.progress = HabitsStore.shared.todayProgress
    }
}
