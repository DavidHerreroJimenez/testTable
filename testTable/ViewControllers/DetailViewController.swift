//
//  DetailViewController.swift
//  testTable
//
//  Created by Mati on 14/11/2019.
//  Copyright © 2019 Swiftland Training. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: NSObjectProtocol{
    
    func printMyNumber(data: String)
}

class DetailViewController: UIViewController {

    //Estas variables  @IBOutlet se inicializan desde aquí. No se pueden setear desde el prepare de otra vista
    @IBOutlet weak var vehicleTitle: UILabel!
    @IBOutlet weak var vehicleDescription: UILabel!
    @IBOutlet weak var vehicleImage: UIImageView!
    
    //estas variables SÍ las podemos inicializar desde otra vista, siempre desde el prepare
    var vehicleTitleContent: String = ""
    var vehicleDescriptionContent = ""
    var vehicleImageContent: UIImage?
    
    
    // @IBOutlet weak var labelSecondView: UILabel!
  
   // @IBOutlet weak var labelNumber: UILabel!
    
    weak var delegate : DetailViewControllerDelegate?
    
    //var labelContent: String = ""
    
    
    
//    @IBAction func actionButton(_ sender: Any) {
//
//        if let delegate = delegate {
//
//            delegate.printMyNumber(data: String(labelNumber.text ?? "NO NUMBER"))
//
//        }
//
//    }
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//
//            if let delegate = delegate {
//
//              delegate.printMyNumber(data: String(labelNumber.text ?? "NO NUMBER"))
//
//            }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        labelSecondView.text = labelContent
//        labelNumber.text = String(arc4random_uniform(10))
        
        
        
        //Una vez cargada la vista, sí podemos dar valor a las variables @IBOutlet desde las var string
        vehicleTitle.text = vehicleTitleContent
        vehicleDescription.text = vehicleDescriptionContent
        vehicleImage.image = vehicleImageContent //UIImage(named: vehicleImageContent)
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
