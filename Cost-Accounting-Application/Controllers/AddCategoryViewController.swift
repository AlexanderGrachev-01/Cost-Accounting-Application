//
//  AddCategoryViewController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class AddCategoryViewController: UIViewController {
    
    // MARK: - Subviews
    
    lazy var button = UIButton()
    lazy var textField = UITextField()
    private lazy var textFieldUnderline = UIView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textField.becomeFirstResponder()
    }
    
    // MARK: - Layout
    
    func configureViews() {
        view.backgroundColor = .systemBackground
        configureTextField()
        configureTextFieldUnderline()
        configureButton()
    }
    
    private func configureTextField() {
        textField.borderStyle = .none
        textField.textColor = .label
        textField.returnKeyType = .default
        textField.delegate = self
        textField.placeholder = "Наименование"
        textField.font = .systemFont(ofSize: 18, weight: .semibold)
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
            $0.left.equalToSuperview().offset(48)
            $0.right.equalToSuperview().offset(-48)
        }
    }
    
    private func configureTextFieldUnderline() {
        textFieldUnderline.backgroundColor = .systemBlue
        view.addSubview(textFieldUnderline)
        
        textFieldUnderline.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom)
            $0.centerX.equalTo(textField.snp.centerX)
            $0.width.equalTo(textField.snp.width)
            $0.height.equalTo(1)
        }
    }
    
    private func configureButton() {
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.alpha = 0.5
        button.isEnabled = false
        button.setTitleColor(.systemBackground, for: .normal)
        button.setTitle("Добавить категорию расходов", for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(30)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().offset(-24)
            $0.height.equalTo(44)
        }
    }
}

// MARK: - Buttons Action

private extension AddCategoryViewController {
    @objc
    func buttonWasTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension AddCategoryViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let count = textField.text?.count,
              count > 0 else {
            button.alpha = 0.5
            button.isEnabled = false
            return
        }
        button.alpha = 1
        button.isEnabled = true
    }
}
