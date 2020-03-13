//
//  ViewController.swift
//  VirusViewer
//
//  Created by 2020-2 on 21/02/20.
//  Copyright © 2020 patricio jaime. All rights reserved.
//

import UIKit //Es un KIT de interfaz de ususario

class ViewController: UITableViewController{ //Despues de los : puede ser hernecia o interfaz
    var pictures = [String]() //Se puede tener una arreglo sin contenido para evitar nulos y vacios o en su caso opcionales
    override func viewDidLoad() { //fun es un metodo
        super.viewDidLoad()//Aqui redefines el comportamiento del padre de donde heredas, y puedes cambiarlo
        //heredar comportamientos 
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Virus Viewer"
        let fm = FileManager.default//let es constanate
        let path = Bundle.main.resourcePath! //Me da la ruta de donde esta el proyecto
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items
        {
            if item.hasSuffix("jpg")
            {
                pictures.append(item)
            }
        }
        print(pictures)
        }



        override func tableView(_  tableView: UITableView, numberOfRowsInSection: Int) -> Int
        {
            //Esta funcion te sirve para contar las columnas necesarias y no tenerlas limitadas
            return pictures.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
            cell.textLabel?.text = pictures[indexPath.row] //A las celdas le vas a a aisignar las las cosas del arreglo
            return cell
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1: Cargar y relacionar la vista Detail
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        {
            //asignars Selected AL IMAGE al string que toca el usuario
            vc.selectedImage = pictures[indexPath.row]
            //camabiar la vista
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
        
}



//Cada que alguien este interactuando con la vista la se llama las veces que salgan elemenetes tableview return  cell
//quien hace la magia es dequeueRusableCell administra la memoria

