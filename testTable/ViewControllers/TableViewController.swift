//
//  TableViewController.swift
//  testTable
//
//  Created by Mati on 13/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, DetailViewControllerDelegate {
    
    func printMyNumber(data: String) {
        print("My number is at first view", data)
    }
    
  
  var vehiculos:[[String]] = [
    ["coche","moto","bicicleta"],
    ["camion","patinete","barco","monopatin"]
  ]
  
  var sections:[String] = ["vehículos1","vehículos2"]
  

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vehiculos[section].count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
    
//    print("INDEXPATH:",indexPath.row);
    
    self.performSegue(withIdentifier: "segueToSecondScreen", sender: indexPath)
    
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSecondScreen"{
            
            let detailView: DetailViewController = segue.destination as! DetailViewController
            
            
            let indexPath = sender as! IndexPath
            
            
            detailView.labelContent = vehiculos[indexPath.section][indexPath.row]
            
            detailView.delegate = self
            
           
        }
    }
  
 
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell:UITableViewCell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle,reuseIdentifier: "mycell")
    
    cell.textLabel?.text = vehiculos[indexPath.section][indexPath.row]
    

    return cell
    
  }
  
  
  func numberOfSections(in tableView:UITableView)-> Int{
     return sections.count;
   }
   
   
   
   
   func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int)-> String? {
     
     return self.sections[section];
   }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
    
    return true;
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    
    if editingStyle == .delete {
      self.vehiculos.remove(at: indexPath.row)
      tableView.beginUpdates()
      tableView.deleteRows(at: [indexPath], with:.automatic)
      tableView.endUpdates()
    }
  }
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
