//
//  HueColorTableViewController.swift
//  ColorPicker
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

protocol HueColorTableViewControllerDelegate{
    func didSelectColor(color:ColorEntry)
}


class HueColorTableViewController:UITableViewController{
    var delegate:HueColorTableViewControllerDelegate! = nil
    var colors:[ColorEntry] = ColorModel().hues(count: 12)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        let row = indexPath.row
        cell?.contentView.backgroundColor = colors[row].color
        cell?.textLabel?.text = colors[row].name
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        title = colors[row].name
        delegate.didSelectColor(color: colors[row])
    }
    
    override func loadView() {
        super.loadView()
    }
    

}
