//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupTextView()
        }
        
        private func setupTextView() {
            messageTextView.delegate = self
            updatePlaceholder()
            updateCharacterCount()
            updateSubmitButton()
        }

    @objc func textViewDidChange(_ textView: UITextView) {
            updatePlaceholder()
            updateCharacterCount()
            updateSubmitButton()
        }

    @objc(textView:shouldChangeTextInRange:replacementText:) func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            let currentText = textView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
            return updatedText.count <= 320
        }

        private func updatePlaceholder() {
            placeholderLabel.isHidden = !messageTextView.text.isEmpty
        }

        private func updateCharacterCount() {
            let count = messageTextView.text.count
            characterCountLabel.text = "\(count)/320"
        }

        private func updateSubmitButton() {
            submitButton.isEnabled = messageTextView.text.count >= 15
        }
    }
