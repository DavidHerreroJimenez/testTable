// Package: testTable,
// File name: NewVehicleViewController.swift,
// Created by David Herrero on 14/11/2019.

import UIKit


protocol NewVehicleViewControllerDelegate: NSObjectProtocol{
    
    func saveNewElementToList(data: Vehiculo)
}
class NewVehicleViewController: UIViewController {
    
    
 
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelImage: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var texFieldTitle: UITextField!
    @IBOutlet weak var textFieldImage: UITextField!
    @IBOutlet weak var textFieldText: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    weak var delegate: NewVehicleViewControllerDelegate?
    
    @IBAction func btnClick(_ sender: Any) {
        
 
        
        let id:Int = Int(Date().timeIntervalSince1970)
        
        let title: String = texFieldTitle.text ?? "NO TITLE"
         
         let text: String = textFieldText.text ?? "NO TEXT"
        
        let image:String = "moto";
        
        
        let newVehicle: Vehiculo = Vehiculo(id:id, title:title, text:text, image:image)
        
         
        if let delegate = delegate {
            
            delegate.saveNewElementToList(data:newVehicle)
            
        }
        
        //Cierra la vista
        self.dismiss(animated: true)

        
        
        
        
        //Aqui va la funcionalidad del botón
    }
    
    var titleContent: String = ""
    var imageContent: String = ""
    var textContent: String = ""
    
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
