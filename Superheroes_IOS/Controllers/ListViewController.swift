//
//  ViewController.swift
//  Superheroes_IOS
//
//  Created by Mañanas on 2/9/24.
//

import UIKit

class ListViewController: UIViewController,
                          UISearchBarDelegate, UITableViewDataSource {


    @IBOutlet weak var heroesSearchBar: UISearchBar!
    @IBOutlet weak var heroesTableView: UITableView!
    
    // MARK: Properties
        
        var superheroList: [Hero] = []
        var superheroInitialList: [Hero] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
               //self.navigationItem.title = "SUPERHEROES"
        
        heroesTableView.dataSource = self
        heroesSearchBar.delegate = self
               
               HeroAPIProvider.searchByName(heroName: "superman", completionHandler: { [weak self] results in
                   self?.superheroList = results
                   DispatchQueue.main.async {
                       self?.heroesTableView.reloadData()
                   }
               })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        heroesTableView.reloadData()
        }

    
    func numberOfSections(in heroesTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = heroesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroViewCell
        
        let superhero = superheroList[indexPath.row]
        
        cell.heroImageView.loadFrom(url: superhero.image.url)
        cell.heroNameLabel.text = superhero.name
        
        return cell
    }
    
    
    // MARK: SearchBar delegate
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            HeroAPIProvider.searchByName(heroName: searchBar.text!, completionHandler: { [weak self] results in
                self?.superheroList = results
                DispatchQueue.main.async {
                    self?.heroesTableView.reloadData()
                }
            })
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.superheroList = self.superheroInitialList
            self.heroesTableView.reloadData()
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if (searchText.isEmpty) {
                self.superheroList = self.superheroInitialList
                self.heroesTableView.reloadData()
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Preguntamos cual es el identificador del segue
            if segue.identifier == "navToDetail" {
                // Obtenemos el viewController de destino
                let viewController = segue.destination as! DetailViewController
                // Obtenemos la celda seleccionada
                let indexPath = heroesTableView.indexPathForSelectedRow!
                // Asignamos en detalle el heroe que corresponde a la celda seleccionada
                viewController.hero = superheroList[indexPath.row]
                // Deseleccionamos la celda para que no aparezca marcada
                heroesTableView.deselectRow(at: indexPath, animated: false)
            }
        }
    
}

