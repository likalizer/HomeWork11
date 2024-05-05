//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController, UITextViewDelegate {
    


    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var agreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        agreeButton.isEnabled = false  
    }
    
    private func setupTextView() {
        textView.delegate = self
        textView.isEditable = false
        textView.isSelectable = true
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom <= height {
            agreeButton.isEnabled = true
        }
    }
}
