//
//  TroubleViewController.swift
//  TroubleRegister
//
//  Created by Alexandre Silva on 24/07/22.
//  Copyright © 2022 AlexDiegoS. All rights reserved.
//

import UIKit

class TroubleViewController: UIViewController {
    @IBOutlet weak var imageViewTrouble: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var textAddress: UITextView!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var btnEdit: UIButton!
    
    var trouble: Trouble?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }
    
    func prepareScreen() {
        if let trouble = trouble {
            if let imageData = trouble.image {
                imageViewTrouble.image = UIImage(data: imageData)
            }
            labelName.text = trouble.name
            labelDate.text = trouble.date
            textAddress.text = trouble.address
            textDescription.text = trouble.descriptionTrouble
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createEditViewController = segue.destination as? CreateEditViewController {
            createEditViewController.trouble = trouble
        }
    }
    
    @IBAction func showEditTrouble(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "editRegisterSegue", sender: nil)
    }
}
