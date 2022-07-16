//
//  CountryListController.swift
//  LectureProject_1
//
//  Created by Shamkhal Guliyev on 25.06.22.
//

import UIKit
import ProgressHUD


class CountryListController: UIViewController, NewTableViewCellDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var model = [CountryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
        
        jsonSetup()
        progress()        
    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "Country", withExtension: "json"), let data = try? Data(contentsOf: jsonFile){
            do{
                model = try JSONDecoder().decode([CountryModel].self, from: data)
                tableView.reloadData()
                print("worked home controller")
                
            }catch{
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    func progress(){
        tableView.isHidden = true
        ProgressHUD.colorAnimation = .systemBlue
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.show("Loading...")
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.tableView.isHidden = false
            ProgressHUD.dismiss()
        }
        
    }
    
    func navigate(index: Int){
        let controller = storyboard?.instantiateViewController(withIdentifier: "CityListController") as! CityListController
        controller.citymodel = model[index].cities
        controller.title = model[index].name
        navigationController?.show(controller, sender: nil)
    }
    
}

extension CountryListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as! NewTableViewCell
        
        cell.newLAbel.text = model[indexPath.row].name
        cell.tag = indexPath.row
        cell.delegate = self
        
        // Closure method
//        cell.buttonCallBack = { index in
//        self.navigate(index: index)
//    }
   
        return cell
    }
    
    
    func actionButtonCalled(index: Int) {
       navigate(index: index)
        
    }
    
}


