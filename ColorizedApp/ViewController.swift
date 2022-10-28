//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Евгений  Гравдин  on 28/10/2022.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var colorizedView: UIView!
  
  @IBOutlet weak var redCounter: UILabel!
  @IBOutlet weak var greenCounter: UILabel!
  @IBOutlet weak var blueCounter: UILabel!
  
  @IBOutlet weak var redSliderOutlet: UISlider!
  @IBOutlet weak var greenSliderOutlet: UISlider!
  @IBOutlet weak var blueSliderOutlet: UISlider!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    colorizedView.layer.cornerRadius = colorizedView.frame.width / 10
  }

  @IBAction func redSlider(_ sender: UISlider) {
    changeCount(counter: redCounter, slider: sender)
    changeColor()
  }
  @IBAction func greenSlider(_ sender: UISlider) {
    changeCount(counter: greenCounter, slider: sender)
    changeColor()
  }
  
  @IBAction func blueSlider(_ sender: UISlider) {
    changeCount(counter: blueCounter, slider: sender)
    changeColor()
  }
  
  
  private func changeColor() {
    colorizedView.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value), green: CGFloat(greenSliderOutlet.value), blue: CGFloat(blueSliderOutlet.value), alpha: 1)
  }
  
  private func changeCount(counter: UILabel, slider: UISlider) {
    counter.text = String(format: "%.2f", slider.value)
  }
}

