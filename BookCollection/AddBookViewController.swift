//
//  AddBookViewController.swift
//  BookCollection
//
//  Created by wellington neto on 05/04/17.
//  Copyright © 2017 wneto. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var livroImageView: UIImageView!
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet var addOrUpdateButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    var newBook : Book? = nil
    var imagePicker =  UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        // verifica se ocorrerá um insert ou um update
        if newBook != nil {
            livroImageView.image = UIImage(data: newBook?.image as! Data)
            nomeTextField.text = newBook?.title
            
            addOrUpdateButton.setTitle("Update", for: .normal)
            
        }else{
            deleteButton.isHidden = true
            
        }
    }

    @IBAction func listarFotos(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        
        livroImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }

    @IBAction func chamarCamera(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
   
    }

    @IBAction func adicionarButton(_ sender: Any) {
        
        if newBook != nil {
            //editar
            newBook!.title = nomeTextField.text
            newBook!.image = UIImagePNGRepresentation(livroImageView.image!) as NSData?
        }else{
            //inserindo
            let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let book = Book(context: context)
            
            book.title = nomeTextField.text
            book.image = UIImagePNGRepresentation(livroImageView.image!) as NSData?
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(newBook!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
}
