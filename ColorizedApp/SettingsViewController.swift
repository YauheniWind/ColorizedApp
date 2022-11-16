//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Евгений  Гравдин  on 28/10/2022.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var colorizedView: UIView!
    
  @IBOutlet var rgbSliders: [UISlider]!
  
  @IBOutlet var rgbCountLabels: [UILabel]!
  
  
  var colorForColorizedView: UIColor!
  var delegate: SettingsViewControllerDelegate!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    changeColor()
    colorizedView.layer.cornerRadius = colorizedView.frame.width / 10
    colorizedView.backgroundColor = colorForColorizedView
    
    updateSlider(tag: 0, value: Float(CIColor(color: colorForColorizedView).red))
    updateSlider(tag: 1, value: Float(CIColor(color: colorForColorizedView).green))
    updateSlider(tag: 2, value: Float(CIColor(color: colorForColorizedView).blue))
    
  }

  @IBAction func changeValueSliders(_ sender: UISlider) {
    switch sender.tag {
    case 0:
      rgbCountLabels[0].text = String(format: "%.2f", rgbSliders[0].value)
    case 1:
      rgbCountLabels[1].text = String(format: "%.2f", rgbSliders[1].value)
    default:
      rgbCountLabels[2].text = String(format: "%.2f", rgbSliders[2].value)
    }
    
    changeColor()
  }
  
  @IBAction func doneButtonPressed(_ sender: UIButton) {
    delegate.changeColor(color: colorizedView.backgroundColor ?? .green)
    dismiss(animated: true)
  }
  
  private func changeColor() {
    colorizedView.backgroundColor = UIColor(red: CGFloat(rgbSliders[0].value),
                                            green: CGFloat(rgbSliders[1].value),
                                            blue: CGFloat(rgbSliders[2].value),
                                            alpha: 1)
  }
  
  private func changeCount(counter: UILabel, slider: UISlider) {
    counter.text = String(format: "%.2f", slider.value)
    changeColor()
  }
  
  private func updateSlider(tag: Int,value: Float) {
    rgbSliders[tag].value = value
    changeValueSliders(rgbSliders[tag])
  }
}
