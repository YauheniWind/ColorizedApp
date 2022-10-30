//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Евгений  Гравдин  on 28/10/2022.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var colorizedView: UIView!
  
  @IBOutlet weak var redCounterLabel: UILabel!
  @IBOutlet weak var greenCounterLabel: UILabel!
  @IBOutlet weak var blueCounterLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    changeColor()
    colorizedView.layer.cornerRadius = colorizedView.frame.width / 10
  }

  @IBAction func redSliderAction(_ sender: UISlider) {
    changeCount(counter: redCounterLabel, slider: sender)
    changeColor()
  }
  @IBAction func greenSliderAction(_ sender: UISlider) {
    changeCount(counter: greenCounterLabel, slider: sender)
    changeColor()
  }
  
  @IBAction func blueSliderAction(_ sender: UISlider) {
    changeCount(counter: blueCounterLabel, slider: sender)
    changeColor()
  }
  
  
  private func changeColor() {
    colorizedView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
  }
  
  private func changeCount(counter: UILabel, slider: UISlider) {
    counter.text = String(format: "%.2f", slider.value)
  }
}

