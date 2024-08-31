//
//  ViewController.swift
//  Counter
//
//  Created by  Дмитрий on 31.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTextCounter: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var numberOfCounter: Int = 0
    var historyText = "История изменений: \n"
    
    @IBAction func plusButton(_ sender: Any) {
        numberOfCounter += 1
        labelTextCounter.text = "Значение счетчика: \(numberOfCounter)"
        
        historyTextView.text = "\(historyTextView.text ?? "Значение не найдено")\n \(getDateTime()): значение изменено на +1"
    }
    @IBAction func minusButton(_ sender: Any) {
        if numberOfCounter > 0 {
            numberOfCounter -= 1
            labelTextCounter.text = "Значение счетчика: \(numberOfCounter)"
            
            historyTextView.text = "\(historyTextView.text ?? "Значение не найдено")\n \(getDateTime()): значение изменено на -1"
        }
        else {
            historyTextView.text = "\(historyTextView.text ?? "Значение не найдено")\n \(getDateTime()): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        
        numberOfCounter = 0
        labelTextCounter.text = "Значение счетчика: \(numberOfCounter)"
        
        historyTextView.text = "\(historyTextView.text ?? "Значение не найдено")\n \(getDateTime()): значение сброшено"
    }
    
    func getDateTime() -> String {
        let dateFormatter = DateFormatter()
        let date = Date()
         
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy HH:mm:ss") // set template after setting locale
        print(dateFormatter.string(from: date)) // December 31
        
        return dateFormatter.string(from: date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

