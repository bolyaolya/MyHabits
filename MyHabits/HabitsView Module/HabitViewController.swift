//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Ольга Бойко on 17.02.2023.
//

import UIKit

class HabitViewController : UIViewController {
    
    //MARK: -var/let
    
    private lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "НАЗВАНИЕ"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var titleTextField : UITextField = {
        let titleTextField = UITextField()
        titleTextField.text = "Бегать по утрам, спать 8 часов и т.п."
        titleTextField.textColor = UIColor(named: "Gray")
        titleTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        return titleTextField
    }()
    
    private lazy var colorLabel : UILabel = {
        let colorLabel = UILabel()
        colorLabel.text = "ЦВЕТ"
        colorLabel.textColor = .black
        colorLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        return colorLabel
    }()
    
    private lazy var colorButton : UIButton = {
        let colorButton = UIButton()
        colorButton.backgroundColor = UIColor(named: "Orange")
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        return colorButton
    }()
    
    private lazy var timeLabel : UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "ВРЕМЯ"
        timeLabel.textColor = .black
        timeLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
    private lazy var chooseTimeLabel : UILabel = {
        let chooseTimeLabel = UILabel()
        chooseTimeLabel.text = "Каждый день в "
        chooseTimeLabel.textColor = .black
        chooseTimeLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        chooseTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return chooseTimeLabel
    }()
    
    private lazy var selectedTimeLabel : UILabel = {
        let selectedTimeLabel = UILabel()
        selectedTimeLabel.text = "11:00 PM"
        selectedTimeLabel.textColor = UIColor(named: "Purple")
        selectedTimeLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        selectedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        return selectedTimeLabel
    }()
    
    private lazy var timePicker : UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.backgroundColor = .black
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        return timePicker
    }()
    
    private lazy var deleteButton : UIButton = {
        let deleteButton = UIButton()
        deleteButton.setTitle("Удалить привычку", for: .normal)
        deleteButton.setTitleColor(UIColor.red, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteButton
    }()
    
    //MARK: -life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    //MARK: -methods
    
    private func setupUI() {
        setupViews()
        setupConstraints()
        setupNavBar()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(colorButton)
        view.addSubview(colorLabel)
        view.addSubview(timeLabel)
        view.addSubview(chooseTimeLabel)
        view.addSubview(selectedTimeLabel)
        view.addSubview(timePicker)
        view.addSubview(deleteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate(
            [titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
             titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             
             titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
             titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
             
             colorLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 15),
             colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             
             colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
             colorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             
             timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
             timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             
             chooseTimeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
             chooseTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

             selectedTimeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
             selectedTimeLabel.leadingAnchor.constraint(equalTo: chooseTimeLabel.trailingAnchor, constant: 5),
             
             timePicker.topAnchor.constraint(equalTo: chooseTimeLabel.bottomAnchor, constant: 15),
             timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
             deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavBarGray")
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Создать"
        
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let saveHabit = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveHabit))
        navigationItem.rightBarButtonItem = saveHabit
        saveHabit.tintColor = UIColor(named: "Purple")
        
        let cancelHabit = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelHabit))
        navigationItem.leftBarButtonItem = cancelHabit
        cancelHabit.tintColor = UIColor(named: "Purple")
    }
    
    @objc func saveHabit() {
    }
    
    @objc func cancelHabit() {
        dismiss(animated: true, completion: nil)
    }
}
