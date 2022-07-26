//
//  CreateEditViewController.swift
//  TroubleRegister
//
//  Created by Alexandre Silva on 24/07/22.
//  Copyright © 2022 AlexDiegoS. All rights reserved.
//

import UIKit

class CreateEditViewController: UIViewController {
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var imageViewTrouble: UIImageView!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var btnAddEdit: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var trouble: Trouble?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.keyboardDismissMode = .interactive
        if let trouble = trouble {
            title = "Edição"
            textName.text = trouble.name
            textAddress.text = trouble.address
            textDescription.text = trouble.descriptionTrouble
            if let imageData = trouble.image {
                imageViewTrouble.image = UIImage(data: imageData)
            }
            btnAddEdit.setTitle("Alterar", for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else {
            return
        }
        
        scrollView.contentInset.bottom = keyboardFrame.size.height - view.safeAreaInsets.bottom
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardFrame.size.height - view.safeAreaInsets.bottom
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar imagem do problema", message: "De onde deseja selecionar a imagem?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Câmera", style: .default) { _ in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }
        let libraryAction = UIAlertAction(title: "Biblioteca de Fotos", style: .default) { _ in
            self.selectPicture(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        let albumAction = UIAlertAction(title: "Álbum de Fotos", style: .default) { _ in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(albumAction)
        present(alert, animated: true, completion: nil)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if trouble == nil {
            trouble = Trouble(context: context)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/YYYY"
            trouble?.date = dateFormatter.string(from: Date())
        }
        trouble?.name = textName.text
        trouble?.address = textAddress.text
        trouble?.descriptionTrouble = textDescription.text
        trouble?.image = imageViewTrouble.image?.jpegData(compressionQuality: 0.9)
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
}

extension CreateEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageViewTrouble.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
