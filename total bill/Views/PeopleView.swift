//
//  People.swift
//  total bill
//
//  Created by Айдар Оспанов on 07.01.2023.
//

import UIKit

class PeopleView: UIView {
    
    let subTitleLable: UILabel = {
        let label = UILabel()
        label.text = "People"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = false
        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 50)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLable: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subTitleLable)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLable)
    }
    
    @objc func minusButtonTapped() {
        counter -= 1
        counterLable.text = "\(counter)"
        
        if counter == 0 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLable.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            subTitleLable.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            subTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            backgroundGrayView.topAnchor.constraint(equalTo: subTitleLable.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLable.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLable.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLable.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: 10),
        ])
    }
}
