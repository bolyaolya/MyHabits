//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Ольга Бойко on 17.02.2023.
//

import UIKit

class HabitCollectionViewCell : UICollectionViewCell {
    
    //MARK: -var/let
    
    private lazy var nameOfHabitLabel : UILabel = {
        let nameOfHabitLabel = UILabel()
        nameOfHabitLabel.numberOfLines = 2
        nameOfHabitLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameOfHabitLabel
    }()
    
    private lazy var dayAndTimeLabel : UILabel = {
        let dayAndTimeLabel = UILabel()
        dayAndTimeLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dayAndTimeLabel.textColor = UIColor(named: "Gray")
        dayAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return dayAndTimeLabel
    }()
    
    private lazy var counterLabel : UILabel = {
        let counterLabel = UILabel()
        counterLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        counterLabel.textColor = UIColor(named: "DarkGray")
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        return counterLabel
    }()
    
    private lazy var doneButton : UIButton = {
        let doneButton = UIButton()
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        return doneButton
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
        contentView.addSubview(nameOfHabitLabel)
        contentView.addSubview(dayAndTimeLabel)
        contentView.addSubview(counterLabel)
        contentView.addSubview(doneButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [nameOfHabitLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
             nameOfHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
             nameOfHabitLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -103),
             
             dayAndTimeLabel.topAnchor.constraint(equalTo: nameOfHabitLabel.bottomAnchor, constant: 4),
             dayAndTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
             
             counterLabel.topAnchor.constraint(equalTo: dayAndTimeLabel.bottomAnchor, constant: 30),
             counterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
             counterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
             
             doneButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
             doneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
             doneButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             doneButton.heightAnchor.constraint(equalToConstant: 38),
             doneButton.widthAnchor.constraint(equalToConstant: 38)
            ])
    }
}
