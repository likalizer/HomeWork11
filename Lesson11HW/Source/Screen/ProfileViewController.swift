//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit


class ProfileViewController: BaseViewController, UITextFieldDelegate {
    
    private var editMode = false

    
    
    @IBAction func EditAction(_ sender: Any) {
        
    }
           
        @IBOutlet weak var firstNameTextField: UITextField!
        @IBOutlet weak var lastNameTextField: UITextField!
        @IBOutlet weak var firstNameCounterLabel: UILabel!
        @IBOutlet weak var lastNameCounterLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
}
    
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"
        
        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode = !editMode
        updateRigthtBarButton()
        
        func changeModeButtonDidTap() {
            editMode = !editMode
        }
        
        func updateEditMode() {
            let isEditable = editMode
            firstNameTextField.isEnabled = isEditable
            lastNameTextField.isEnabled = isEditable
            firstNameCounterLabel.isHidden = !isEditable
            lastNameCounterLabel.isHidden = !isEditable
            if isEditable {
                firstNameTextField.becomeFirstResponder()
            } else {
                view.endEditing(true)
            }
        }
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let currentText = textField.text, let stringRange = Range(range, in: currentText) else {
                return false
            }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            if updatedText.count > 30 {
                return false
            }
            textField.text = updatedText
            updateCharacterCounts()
            return false
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            updateCharacterCounts()
        }
        
        func updateCharacterCounts() {
            let firstNameCount = firstNameTextField.text?.count ?? 0
            let lastNameCount = lastNameTextField.text?.count ?? 0
            firstNameCounterLabel.text = "\(30 - firstNameCount)"
            lastNameCounterLabel.text = "\(30 - lastNameCount)"
            firstNameCounterLabel.textColor = firstNameCount < 30 ? .green : .red
            lastNameCounterLabel.textColor = lastNameCount < 30 ? .green : .red
        }
    }
}


