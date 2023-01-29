//
//  AddNameCountViewController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

protocol AddNameCountDelegate: AnyObject {
    func returnNameCount(name: String, count: Double)
}

final class AddNameCountViewController: UIViewController {
    
    var delegate: AddNameCountDelegate?
    var buttonTitle: String = "Добавить"
    
    // MARK: - Subviews
    
    private lazy var button = UIButton()
    private lazy var nameTextField = UITextField()
    private lazy var countTextField = UITextField()
    private lazy var nameTextFieldUnderline = UIView()
    private lazy var countTextFieldUnderline = UIView()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: - Layout
    
    func configureViews() {
        view.backgroundColor = .systemBackground
        configureCountTextField()
        configureCountTextFieldUnderline()
        configureNameTextField()
        configureNameTextFieldUnderline()
        configureButton()
    }
    
    private func configureCountTextField() {
        countTextField.borderStyle = .none
        countTextField.textColor = .label
        countTextField.delegate = self
        countTextField.placeholder = "Сумма"
        countTextField.keyboardType = .numberPad
        countTextField.font = .systemFont(ofSize: 18, weight: .regular)
        countTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countTextField)
        
        countTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
            $0.left.equalToSuperview().offset(48)
            $0.right.equalToSuperview().offset(-48)
        }
    }
    
    private func configureCountTextFieldUnderline() {
        countTextFieldUnderline.backgroundColor = .systemBlue
        view.addSubview(countTextFieldUnderline)
        
        countTextFieldUnderline.snp.makeConstraints {
            $0.top.equalTo(countTextField.snp.bottom)
            $0.centerX.equalTo(countTextField.snp.centerX)
            $0.width.equalTo(countTextField.snp.width)
            $0.height.equalTo(1)
        }
    }
    
    private func configureNameTextField() {
        nameTextField.borderStyle = .none
        nameTextField.textColor = .label
        nameTextField.delegate = self
        nameTextField.placeholder = "Наименование"
        nameTextField.font = .systemFont(ofSize: 18, weight: .regular)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        nameTextField.snp.makeConstraints {
            $0.bottom.equalTo(countTextField.snp.top).offset(-32)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
            $0.left.equalToSuperview().offset(48)
            $0.right.equalToSuperview().offset(-48)
        }
    }
    
    private func configureNameTextFieldUnderline() {
        nameTextFieldUnderline.backgroundColor = .systemBlue
        view.addSubview(nameTextFieldUnderline)
        
        nameTextFieldUnderline.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom)
            $0.centerX.equalTo(nameTextField.snp.centerX)
            $0.width.equalTo(nameTextField.snp.width)
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
        button.setTitle(buttonTitle, for: .normal)
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

private extension AddNameCountViewController {
    @objc
    func buttonWasTapped() {
        guard let text = nameTextField.text,
              let count = Double(countTextField.text ?? ""),
              count > 0 else {
            return
        }
        delegate?.returnNameCount(name: text, count: count)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension AddNameCountViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = nameTextField.text,
              let count = countTextField.text,
              count.count > 0,
              text.count > 0 else {
            button.alpha = 0.5
            button.isEnabled = false
            return
        }
        button.alpha = 1
        button.isEnabled = true
    }
}

