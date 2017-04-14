//
//  ViewController.swift
//  BookCollection
//
//  Created by wellington neto on 05/04/17.
//  Copyright © 2017 wneto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var books : [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let listBooks = books[indexPath.row]
        
        cell.textLabel?.text = listBooks.title
        cell.imageView?.image = UIImage(data: listBooks.image as! Data)
        
        return cell
    }
    
    //quando selecionar um livro da lista
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listBooks = books[indexPath.row]
        performSegue(withIdentifier: "showBookSegue", sender: listBooks)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! AddBookViewController
        nextVC.newBook = sender as? Book
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try  books = context.fetch(Book.fetchRequest())
            tableView.reloadData()
        } catch  {
            print("erro")
        }
       
    }


}

