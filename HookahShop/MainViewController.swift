//
//  MainViewController.swift
//  HookahShop
//
//  Created by Иван on 4/19/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let imageView = UIImageView()
    
    var segmentedControl = UISegmentedControl()
    
    let menuArray = ["Hookahs", "Bowls", "Tobacco"]
    
    let hookahsArray = ["Gray", "Orange", "Red"]
    let bowlsArray = ["Black", "Blue", "Green"]
    let tastesArray = ["Pomelo", "Banana dajkiri", "Elderberry"]
    
    let hookahPicturesArray = ["hookahgray.jpg", "hookahorange.jpg", "hookahred.jpg"]
    let bowlsPicturesArray = ["bowlblack.jpg", "bowlblue.jpg", "bowlgreen.jpg"]
    let tobaccoPicturesArray = ["pomelo.jpg", "daykiri.jpg", "elderberry.jpg"]
    
    var itemsArray = [String]()
    var propertyArray = [String]()
    
    var pickerView = UIPickerView()
    
    var addToCartButton = UIButton()
    
    var countLabel = UILabel()
    
    var count = 0
    
    var goToCartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: "background.png") {
            self.view.backgroundColor = UIColor(patternImage: patternImage)
        }
        
        createImageView()
        createSegmentedControl()
        updateImage()
        createpickerView(picker: pickerView)
        createAddButton(button: addToCartButton)
        createCountLabel()
        
    }
    
    //MARK: Methods
    func createSegmentedControl() {
        segmentedControl = UISegmentedControl(items: self.menuArray)
        segmentedControl.frame = CGRect(x: 0, y: 40, width: view.frame.width, height: 50)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .gray
        segmentedControl.addTarget(self, action: #selector(segmentedControlAction), for: .valueChanged)
        
        
        view.addSubview(segmentedControl)
    }
    
    @objc func segmentedControlAction(target: UISegmentedControl) {
        if target == segmentedControl {
            pickerView.reloadAllComponents()
            updateImage()
        }
    }
    
    func createImageView() {
        imageView.frame = CGRect(x: 5, y: 100, width: 400, height: 400)
        imageView.layer.cornerRadius = 15
        
        updateImage()
        
        view.addSubview(imageView)
    }
    
    func updateImage() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(named: hookahPicturesArray[pickerView.selectedRow(inComponent: 0)])
        case 1:
            imageView.image = UIImage(named: bowlsPicturesArray[pickerView.selectedRow(inComponent: 0)])
        case 2:
            imageView.image = UIImage(named: tobaccoPicturesArray[pickerView.selectedRow(inComponent: 0)])
        default:
            break
        }
    }
    
    
    
    func createpickerView(picker: UIPickerView) {
        pickerView = UIPickerView(frame: CGRect(x: 50 , y: 550, width: 300, height: 80))
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .gray
        pickerView.layer.cornerRadius = 15
        view.addSubview(pickerView)
    }
    
    func createAddButton(button: UIButton) {
        addToCartButton = UIButton(frame: CGRect(x: 50, y: 700, width: 300, height: 60))
        addToCartButton.backgroundColor = .purple
        addToCartButton.tintColor = .black
        addToCartButton.setTitle("Add to cart", for: .normal)
        addToCartButton.layer.cornerRadius = 15
        let action = UIAction { (_) in
            self.count += 1
            self.countLabel.text = "Items in cart - \(self.count)"
            
            if self.count == 1 {
                self.createGoToCartButton()
            }
            self.fillArrays()
            print(self.propertyArray)
        }
        addToCartButton.addAction(action, for: .touchUpInside)
        view.addSubview(addToCartButton)
    }
    
    
    func createCountLabel() {
        countLabel = UILabel(frame: CGRect(x: 50, y: 765, width: 300, height: 30))
        countLabel.textColor = .white
        countLabel.textAlignment = .center
        view.addSubview(countLabel)
    }
    
    func createGoToCartButton() {
        goToCartButton = UIButton(frame: CGRect(x: 50, y: 800, width: 300, height: 60))
        goToCartButton.backgroundColor = .systemGreen
        goToCartButton.tintColor = .white
        goToCartButton.setTitle("Go to cart", for: .normal)
        goToCartButton.layer.cornerRadius = 15
        let action = UIAction { (_) in
            self.performSegue(withIdentifier: "goToCartSegue", sender: nil)
        }
        goToCartButton.addAction(action, for: .touchUpInside)
        view.addSubview(goToCartButton)
    }
    
    func fillArrays() {
        itemsArray.append(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? "error")
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            propertyArray.append(hookahsArray[pickerView.selectedRow(inComponent: 0)])
        case 1:
            propertyArray.append(bowlsArray[pickerView.selectedRow(inComponent: 0)])
        case 2:
            propertyArray.append(tastesArray[pickerView.selectedRow(inComponent: 0)])
        default:
            break
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToCartSegue" else { return }
        guard let destination = segue.destination as? CartViewController else { return }
        destination.itemsArray = self.itemsArray
        destination.propertyArray = self.propertyArray
    }
    
    
}

//MARK: PickerViewDelegate
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return hookahsArray[row]
        case 1:
            return bowlsArray[row]
        case 2:
            return tastesArray[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateImage()
        pickerView.reloadAllComponents()
        
    }
    
    
}
