//
//  SecurityTipsViewController.swift
//  SuperSenha
//
//  Created by Jemesson Lima on 17/04/21.
//

import UIKit

class SecurityTipsViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true

        if let path = Bundle.main.path(forResource: "DicasSenha", ofType: "txt") {
            let contents = try? String(contentsOfFile: path)
            textView.text = contents ?? "Could not load contents for file \(path)."
        }
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
