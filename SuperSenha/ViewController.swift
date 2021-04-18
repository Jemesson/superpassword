//
//  ViewController.swift
//  SuperSenha
//
//  Created by Jemesson Lima on 17/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtNumberOfPasswords: UITextField!
    @IBOutlet weak var txtTotalOfChars: UITextField!
    @IBOutlet weak var swLowercaseLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swUppercaseLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var btGerarSenhas: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        if let numberOfPasswords = Int(txtNumberOfPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }

        if let numberOfCharacters = Int(txtTotalOfChars.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }

        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useUppercaseLetters = swUppercaseLetters.isOn
        passwordsViewController.useLowercaseLetters = swLowercaseLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn

        view.endEditing(true)
    }

    @IBAction func ValidarSwitchs(_ sender: UIButton) {
        validateNumberOfPasswords()
        validateTotalChars()

        if !swLowercaseLetters.isOn && !swNumbers.isOn &&
            !swUppercaseLetters.isOn && !swSpecialCharacters.isOn {

            btGerarSenhas.isEnabled = false

            let alertMsg = UIAlertController(
                title: "Alert!",
                message: "Please. You need to select one option to create passwords.",
                preferredStyle: .alert
            )

            alertMsg.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMsg, animated: true, completion: nil)
        }
    }

    @IBAction func swLowerLettersChange(_ sender: UISwitch) {
        switchOptionIsOn()
    }
    
    @IBAction func swNumbersChange(_ sender: UISwitch) {
        switchOptionIsOn()
    }
    
    @IBAction func swUppercalettersChange(_ sender: UISwitch) {
        switchOptionIsOn()
    }
    
    @IBAction func swSpecialCharacteresChange(_ sender: UISwitch) {
        switchOptionIsOn()
    }
    
    private func validateNumberOfPasswords() {
        let numberOfPasswords = Int(txtNumberOfPasswords.text ?? "1")

        if numberOfPasswords != nil && (numberOfPasswords! == 0 || numberOfPasswords! > 99) {
            let alertMsg = UIAlertController(
                title: "Alert!",
                message: "The number of passwords: \(numberOfPasswords!) is not acceptable.\n Hint: The range is between 1 to 99",
                preferredStyle: .alert
            )

            alertMsg.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMsg, animated: true, completion: nil)
        }
    }

    private func validateTotalChars() {
        let numberOfChars = Int(txtTotalOfChars.text ?? "10")

        if numberOfChars != nil && (numberOfChars! == 0 || numberOfChars! > 16) {
            let alertMsg = UIAlertController(
                title: "Alert!",
                message: "The number of characters: \(numberOfChars!) is not acceptable.\n Hint: The range is between 1 to 16",
                preferredStyle: .alert
            )

            alertMsg.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMsg, animated: true, completion: nil)
        }
    }

    private func switchOptionIsOn() {
        if swLowercaseLetters.isOn || swNumbers.isOn || swUppercaseLetters.isOn || swSpecialCharacters.isOn {
            btGerarSenhas.isEnabled = true
        }
    }
}
