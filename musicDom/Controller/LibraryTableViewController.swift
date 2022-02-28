//
//  LibraryTableViewController.swift
//  musicDom
//
//  Created by Consultant on 2/27/22.
//

import UIKit



class LibraryTableViewController: UITableViewController {
    var image = UIImage()
    
    var curatedList = [
        
        Album(nameImage: "curated1", labelAlbum: "20 Classic"),
        Album(nameImage: "curated2", labelAlbum: "Tiffany"),
        Album(nameImage: "curated3", labelAlbum: "ABBA"),
        Album(nameImage: "curated4", labelAlbum: "Rid Rock"),
        Album(nameImage: "curated5", labelAlbum: "Kiss"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return curatedList.count
    }

    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell", for: indexPath)

         // Configure the cell...
         cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
         let curatedList = curatedList[indexPath.row]
         cell.textLabel?.text = curatedList.labelAlbum
         
         cell.detailTextLabel?.text = curatedList.nameImage
         cell.imageView?.image = UIImage(named: curatedList.nameImage)
         
         return cell
     }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.albumName = curatedList[indexPath.row].labelAlbum
        vc?.img = UIImage(named: curatedList[indexPath.row].nameImage)!
        self.navigationController?.pushViewController(vc!, animated: true)

    }
}

