//
//  DetailViewController.swift
//  Superheroes_IOS
//
//  Created by Mañanas on 4/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLable: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    
    var hero: Hero? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let hero = hero {
            
            heroImageView.loadFrom(url: hero.image.url)
            heroNameLabel.text = hero.name
            intelligenceLabel.text = "Intelligence: " + (hero.powerstats.intelligence ?? "NA")
            strengthLable.text = "Strength: " + (hero.powerstats.strength ?? "NA")
            speedLabel.text = "Speed: " + (hero.powerstats.speed ?? "NA")
            durabilityLabel.text = "Durability: " + (hero.powerstats.durability ?? "NA")
            powerLabel.text = "Power: " + (hero.powerstats.power ?? "NA")
            combatLabel.text = "Combat: " + (hero.powerstats.combat ?? "NA")
            
        }
        
        /* func getHeroById() {
         //loading.isHidden = false
         Task {
         do {
         let heroDetails = try await HeroAPIProvider.findHeroById(heroId: hero!.id)
         
         //dailyHoroscopeTextView.text = luck
         
         //loading.isHidden = true
         } catch {
         print(error)
         }
         }
         }
         
         
         }*/
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
