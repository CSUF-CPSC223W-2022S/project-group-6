//
//  currency.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 2/17/22.
//
import UIKit

class Currency: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    // array for the name of the currency code 
    var currency: [String] = []
    // the values of the currency
    var value: [Double] = []
    var active = 0.0
    
    // MARK: - IBOutlets Curency
    @IBOutlet var label: UILabel!
    
    @IBOutlet var amount: UITextField!
    
    @IBOutlet var pickerView: UIPickerView!
    
    //MARK: - IBOutlets pop up
    @IBOutlet var blur: UIVisualEffectView!
    @IBOutlet var popUp: UIView!
    @IBAction func offlineButton(_ sender: Any) {
        animateOut(desiredView: popUp)
        animateOut(desiredView: blur)
    }
    
    //MARK: - IBOutlets switch
    @IBAction func Onswitch(_ sender: UISwitch) {
        //if #available(iOS 13.0, *) {
            //let appDelegate = UIApplication.shared.windows.first
            //if sender.isOn {
                //appDelegate?.overrideUserInterfaceStyle = .dark
                //return
            //}
            //appDelegate?.overrideUserInterfaceStyle = .light
            //return
        //}
    }
    
    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        fetchJSON()
        amount.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        
        // animation
        blur.bounds = view.bounds
        popUp.bounds = CGRect(x: 0, y: 0, width: view.bounds.width * 0.9, height: view.bounds.height * 0.4)
        //animateIn(desiredView: popUp)
        //animateIn(desiredView: blur)
    }
    
    //MARK: Function for pop up
    func animateIn(desiredView: UIView) {
        let background = view!
        
        background.addSubview(desiredView)
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = background.center
        
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    // MARK: - PickerView Code
    @objc func updateViews(input: Double) {
        guard let textAmount = amount.text, let theAmount = Double(textAmount) else {
            return
        }
        if amount.text != "" {
            let total = theAmount * active
            label.text = String(format: "%.2f", total)
        }
    }
       
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
       
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currency[row]
    }
       
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        active = value[row]
        updateViews(input: active)
    }
       
    // MARK: - JSON Method to get the rates data
     func fetchJSON() {
         guard let url = URL(string: Constants.API) else {
             return
         }
         URLSession.shared.dataTask(with: url) { data, response, error in
             // handle errors
             if error != nil {
                 print(error!)
                 return
             }
            
             // safely unwrap all the data
             guard let safeData = data else { return }
            
             // decode the JSON Data
             do {
                 let results = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                 self.currency.append(contentsOf: results.rates.keys)
                 self.value.append(contentsOf: results.rates.values)
                 print(results.rates)
             } catch {
                 print(error)
             }
         }.resume()
     }
}
