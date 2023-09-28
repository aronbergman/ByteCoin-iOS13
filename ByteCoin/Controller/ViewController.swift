//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let coinManager = CoinManager()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currencyLabel = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currencyLabel)
    }

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
//    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//           DispatchQueue.main.async {
//               self.temperatureLabel.text = weather.temperatureString
//               self.conditionImageView.image = UIImage(systemName: weather.conditionName)
//               self.cityLabel.text = weather.cityName
//           }
//       }
    
    func didFailWithError(error: Error) {
          print("❗️ \(error)")
      }
}
