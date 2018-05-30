//
//  HourlyWeatherVC.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import UIKit

class HourlyWeatherVC: UIViewController {
    
    //Properties
    let manager = WeatherDataManager()
    var hourlyData = [HourlyWeatherData]()
    
    //Outlets
    @IBOutlet weak var hourlyWeatherTable: UITableView!
}

//MARK:- Life Cycle

extension HourlyWeatherVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fetchHourlyData()
        self.title = Texts.Titles.hourlyVC
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK:- Custom Methods

extension HourlyWeatherVC {
    
    func fetchHourlyData(){
        manager.getHourlyWeatherDetails { (error) in
            if let error = error {
                self.showAlert(error.localizedDescription, actions: nil)
                return
            }
            self.initializeView()
        }
    }
    
    func initializeView() {
        hourlyWeatherTable.register(UINib.init(nibName: Texts.CustomNib.hourlyCell, bundle: nil), forCellReuseIdentifier: Texts.CustomNib.hourlyCellId)
        hourlyWeatherTable.register(UINib.init(nibName: Texts.CustomNib.hourlyListHeader, bundle: nil), forHeaderFooterViewReuseIdentifier: Texts.CustomNib.hourlyListHeader)
        guard let hourlyDetails = manager.hourlyWeatherDetails else {
            return
        }
        hourlyData = hourlyDetails
    }
}

//MARK:- TableView Data Source and Delegates

extension HourlyWeatherVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Texts.CustomNib.hourlyListHeader) as! HourlyListTableHeader
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hourlyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :  HourlyWeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: Texts.CustomNib.hourlyCellId) as! HourlyWeatherTableViewCell
        cell.model = HourlyCellModel(weatherData: self.hourlyData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
