//
//  LearnTableViewController.swift
//  AnimalPlanet
//
//  Created by Apple on 3/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
class LearnTBV: UITableViewController {
var animalList = [AnimalsNS]()//inti array of the animals
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Create objects and add them to the array
        
        var animal = AnimalsNS(title: "Cat", desc: "-Cats have been around 4,000 years. \n\n-Lifespan: 4 – 5 years(In the wild) \n\n-Most cats have five claws on their front paws, and four on their rear paws.", img: "cat.png")
        animalList += [animal]
        
         animal = AnimalsNS(title: "Dog" , desc: "-Examples of these breeds: Bulldog, German Shepherd. \n\n-Puppies have 28 teeth and normal adult dogs have 42 \n\n-Puppies are pure white when they are born and develop their spots as they grow older.", img: "dog2.png" )
        animalList += [animal]
        
         animal = AnimalsNS(title: "Bird", desc: "-Birds have feathers, wings, lay eggs and are warm blooded. \n\n-There are around 10000 different species of birds worldwide \n\n-Kiwi birds are blind, so they hunt by smell.", img: "bird2.png" )
        animalList += [animal]
        
        animal = AnimalsNS(title: "Dolphin", desc: "-The smallest of the dolphin species, Maui's Dolphin. \n\n-The largest dolphin species is the orca, or killer whale \n\n-Dolphins are very social, living in groups. Large pods of dolphins can have 1,000 members or more.", img: "dholpin2.png" )
        animalList += [animal]
        
         animal = AnimalsNS(title: "Horse", desc: "-A male horse is called a stallion \n\n-A female horse is called a mare \n\n-Horses can sleep both lying down and standing up.", img: "horse.png" )
        animalList += [animal]
       

        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animalList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //each cell in the table has an address (number) this address represnted by the indexPath parameter
        
        // the indexPath.row tells the row number i am working with.
        
        //use this with (Custome) cell
        var  Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AnimalCell
        
        //use this is you are using array of objects
        var animal = animalList[indexPath.row]

        Cell.img.image = UIImage(named: animal.img)
        Cell.img.layer.cornerRadius = 15 //to make the img have rounde borders
        Cell.lblName.text = animal.title
        Cell.lblDesc.text = animal.desc
        // Configure the cell...

        return Cell
    }
    
    
    
   }
