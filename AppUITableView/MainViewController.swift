//
//  MainViewController.swift
//  AppUITableView
//
//  Created by Михаил on 23.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var reversSortingButton: UIBarButtonItem!
    
    var places: Results<Place>!
    var ascendingSorting = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        places = realm.objects(Place.self)
    }

    // MARK: - Table view data source



     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]
        
        
        cell.nameLabel.text = place.name
        cell.locationLable.text = place.location
        cell.typeLabel.text = place.tupe
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
     

        
        
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true


 
        return cell
    }
    
    // MARK: - Table view delegate
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let place = places[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in

            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }


    // MARK: - Navigation

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let place = places[indexPath.row]
            let newPlaceVC = segue.destination as! NewPlaceViewController
            newPlaceVC.currentPlace = place
            
        }
        
    }
   
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
        
        newPlaceVC.savePlace()
       
        tableView.reloadData()
    }
    
    
    @IBAction func sortSelection(_ sender: UISegmentedControl) {
        sorting()
        
    }
    
    @IBAction func reverseSorting(_ sender: Any) {
        ascendingSorting.toggle()
        if ascendingSorting {
            reversSortingButton.image = #imageLiteral(resourceName: "AZ")
        } else {
            reversSortingButton.image = #imageLiteral(resourceName: "ZA")
        }
        
        sorting()
        
        
    }
    
    private func sorting() {
        if segmentedControl.selectedSegmentIndex == 0{
            places = places.sorted(byKeyPath: "date", ascending: ascendingSorting)
        } else {
          places = places.sorted(byKeyPath: "name", ascending: ascendingSorting)
        }
        tableView.reloadData()
    }
}
