//
//  ConcentrationThemeChooserViewController.swift
//  Concentration-Game
//
//  Created by Husayn Hakeem on 2/14/18.
//  Copyright © 2018 HusaynHakeem. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥅🏒",
        "Animals": "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮",
        "Faces": "😄😅😂🤣😇😉😍😘🤑😎🤡"
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitControllerConcentrationViewController {
            if let label = (sender as? UIButton)?.currentTitle, let theme = themes[label] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let label = (sender as? UIButton)?.currentTitle, let theme = themes[label] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose theme", sender: sender)
        }
    }
    
    var splitControllerConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose theme" {
            if let label = (sender as? UIButton)?.currentTitle, let theme = themes[label] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
    }

}
