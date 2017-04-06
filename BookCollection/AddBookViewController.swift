//
//  AddBookViewController.swift
//  BookCollection
//
//  Created by wellington neto on 05/04/17.
//  Copyright © 2017 wneto. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet var livroImageView: UIImageView!
    @IBOutlet var nomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func listarFotos(_ sender: Any) {
        print("photo tapped")
    }

    @IBAction func chamarCamera(_ sender: Any) {
        print("camera tapped")
    }

    @IBAction func adicionarButton(_ sender: Any) {
        print("add tapped")
    }
    
}
