//
// ColorDetailViewController.swift
// ColorPicker
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

class ColorDetailViewController: UIViewController, HueColorTableViewControllerDelegate  {
    let colorLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Delegates
    func didSelectColor(color: ColorEntry) {
        view.backgroundColor = color.color
        colorLabel.text = color.name
    }
    
    //MARK:- Layout
    // All layout methods go here.
    func addLayout(){
        colorLabel.text = "Color Detail"
        let font = UIFont(name: "AmericanTypewriter", size: 26)!
        let scaledFont = UIFontMetrics.default.scaledFont(for: font)
        
        //let dynamicFont = UIFont.preferredFont(forTextStyle: .title1)
        colorLabel.font = scaledFont
        colorLabel.adjustsFontForContentSizeCategory = true
         colorLabel.numberOfLines = 0
        colorLabel.backgroundColor = .lightGray
        colorLabel.textAlignment = .center
        view.addSubview(colorLabel)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints += [NSLayoutConstraint(item: colorLabel, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0)]
        constraints += [NSLayoutConstraint(item: colorLabel, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0)]
        constraints += [NSLayoutConstraint(item: colorLabel, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0)]
        constraints += [NSLayoutConstraint(item: colorLabel, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1 / 9, constant: 0)]
        view.addConstraints(constraints)
    }
}
