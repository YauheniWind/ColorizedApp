//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Евгений  Гравдин  on 15/11/2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
  func changeColor(color: UIColor)
}

class MainViewController: UIViewController {

  @IBOutlet var mainView: UIView!
  
  var delegate: SettingsViewControllerDelegate!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    mainView.backgroundColor = .systemPink
    
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let settingsVC = segue.destination as? SettingsViewController else { return }
    
    settingsVC.colorForColorizedView = view.backgroundColor
    settingsVC.delegate = self

  }
  
  @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
    
    performSegue(withIdentifier: "settingsVC", sender: nil)
  }
  
  
}

extension MainViewController: SettingsViewControllerDelegate {
  func changeColor(color: UIColor) {
    view.backgroundColor = color
  }
}
