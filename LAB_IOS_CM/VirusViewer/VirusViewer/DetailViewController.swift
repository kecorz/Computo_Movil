//
//  DetailViewController.swift
//  VirusViewer
//
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    //con el ? no te obliga a inicializarlo porque no sabes el tipo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.never
            //Datos enumeradores, que lo que hace es un esoecie de catalogos
        title = selectedImage //Opcional igualada a opcional
        if let image = selectedImage
        {
            imageView.image = UIImage(named: image)
        }
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
