//
//  TableViewController.swift
//  testTable
//
//  Created by Mati on 13/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, DetailViewControllerDelegate, NewVehicleViewControllerDelegate {
  
    
    @IBOutlet weak var vehiculosTableView: UITableView!
    
    
    
    @IBOutlet weak var buttonNewVehicle: UIBarButtonItem!
    
    func printMyNumber(data: String) {
        print("My number is at first view", data)
    }
    
    func saveNewElementToList(data: Vehiculo) {
        print("saveNewElementToList")
        self.vehiculos.append(data)
        
        self.vehiculosTableView.reloadData()
        
      }
  
    var vehiculos:[Vehiculo] = [Vehiculo(id: 0, title: "Coche", text: "Este coche mola", image: UIImage(named: "coche")),
                                Vehiculo(id: 1, title: "Moto", text: "Esta moto mola", image: UIImage(named: "moto")),
                                Vehiculo(id: 2, title: "Patinete", text: "Este patinete mola", image: UIImage(named: "patinete"))]
    
    //["coche","moto","bicicleta","camion","patinete","barco","monopatin"]
  
  var sections:[String] = ["vehículos1"]
  

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return vehiculos.count
  }
  
  //función delegada que salta cuando seleccionamos una row
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
    
    //lo mismo que hace storyboard internamente para llamar a otra vista (segue)
    self.performSegue(withIdentifier: "segueToSecondScreen", sender: indexPath)
    
  }
    
    //cualquier segue llama a la función prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToSecondScreen"{
            
            //Referencia al controlador de la vista al que voy a ir
            let detailView: DetailViewController = segue.destination as! DetailViewController
            
            
            let indexPath = sender as! IndexPath
            
            
            //detailView.labelContent = vehiculos[indexPath.section][indexPath.row]
            
            detailView.delegate = self
            
            let vehicle = vehiculos[indexPath.row]
            
            detailView.vehicleTitleContent = vehicle.title
            detailView.vehicleDescriptionContent = vehicle.text
            detailView.vehicleImageContent = vehicle.image
            
           
        }else if segue.identifier == "toAddView"{
            
          //Asociamos el delegado
            
            let addView: NewVehicleViewController = segue.destination as! NewVehicleViewController
            
            addView.delegate = self
            
        }
    }
  
 
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
   // let cell:UITableViewCell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle,reuseIdentifier: "mycell")
    
    //cell.textLabel?.text = vehiculos[indexPath.row]
    
    let cell: VehiculoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VehiculoCell", for: indexPath) as! VehiculoTableViewCell
    
    
    let vehiculo: Vehiculo = vehiculos[indexPath.row]
    
    cell.vehiculoTitleLabel.text = vehiculo.title
    cell.vehiculoTextLabel.text = vehiculo.text
    cell.vehiculoImageView.image = vehiculo.image  //UIImage(named: vehiculo.image)
    

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
