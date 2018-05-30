//
//  WeeklyWeatherVC.swift
//  WeatherForecast
//
//  Created by Karthik on 5/29/18.
//  Copyright © 2018 Karthik. All rights reserved.
//

import UIKit

class WeeklyWeatherVC: UIViewController {
    
    //Properties
    let manager = WeatherDataManager()
    var weeklyData = [WeeklyWeatherData]()
    var cellsPerRow:CGFloat = 4
    
    //Outlets
    @IBOutlet weak var weeklyWeatherCollectionView: UICollectionView!
}

extension WeeklyWeatherVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        collectionLayoutHandling()
        fetchWeeklyWeather()
        self.title = Texts.Titles.weeklyVC
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WeeklyWeatherVC {
    
    func fetchWeeklyWeather() {
        manager.getWeeklyWeatherDetails { (error) in
            if let error = error {
                self.showAlert(error.localizedDescription, actions: nil)
                return
            }
            self.initializeView()
        }
    }
    
    func initializeView() {
        guard let weeklyDetails = manager.weeklyWeatherDetails else {
            return
        }
        weeklyData = weeklyDetails
        weeklyWeatherCollectionView.register(UINib.init(nibName: Texts.CustomNib.weeklyCell, bundle: nil), forCellWithReuseIdentifier: Texts.CustomNib.weeklyCellId)
    }
    
    func collectionLayoutHandling() {
        cellsPerRow = (UIDevice.current.orientation.isLandscape) ? 7 : 4
        guard let layout = weeklyWeatherCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        layout.invalidateLayout()
        weeklyWeatherCollectionView.reloadData()
    }
}

extension WeeklyWeatherVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeklyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Texts.CustomNib.weeklyCellId, for: indexPath) as! WeeklyWeatherCollectionViewCell
        cell.model = WeeklyCellModel(weatherData: self.weeklyData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize.zero
        }
        let padding = layout.minimumInteritemSpacing
        let widthMinusPadding = collectionView.frame.size.width - (padding * (cellsPerRow - 1))
        let eachSide = widthMinusPadding / cellsPerRow
        return CGSize(width: eachSide, height: eachSide)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionLayoutHandling()
    }
}
