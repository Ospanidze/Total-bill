//
//  TotalBillView.swift
//  total bill
//
//  Created by Айдар Оспанов on 07.01.2023.
//

import UIKit

class TotalBillView: UIView {
    
    let subTitleLable: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextField: UITextField = {
        let textField = UITextField()
        textField.text = "12000"
        textField.font = UIFont.systemFont(ofSize: 48)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 12
        textField.keyboardType = .numberPad
        textField.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
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
        addSubview(sumTextField)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            subTitleLable.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            subTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            sumTextField.topAnchor.constraint(equalTo: subTitleLable.bottomAnchor, constant: 2),
            sumTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            sumTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            sumTextField.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
