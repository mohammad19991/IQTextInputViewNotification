//
//  ViewController.swift
//  IQTextInputViewNotification
//
//  Created by hackiftekhar on 07/22/2024.
//  Copyright (c) 2024 hackiftekhar. All rights reserved.
//

import UIKit
import IQTextInputViewNotification

class ViewController: UIViewController {

    private let keyboard: IQTextInputViewNotification = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func subscribeAction(_ sender: UIBarButtonItem) {

        let identifier: String = "NotificationIdentifier"

        if keyboard.isSubscribed(identifier: identifier) {
            sender.title = "Subscribe"
            keyboard.unsubscribe(identifier: identifier)
            keyboard.textInputView?.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        } else {
            sender.title = "Unsubscribe"
            keyboard.subscribe(identifier: identifier) { info in
                print(info.event.name, ":", info.textInputView)

                switch info.event {
                case .beginEditing:
                    info.textInputView.backgroundColor = UIColor(named: "FBBC05")
                case .endEditing:
                    info.textInputView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
                }
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
