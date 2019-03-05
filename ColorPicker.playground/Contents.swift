//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//
import UIKit
import PlaygroundSupport

class ColorEntry{
    var name:String = ""
    var color:UIColor
    var hue:CGFloat = 0.0
    var brightness:CGFloat = 0.5
    var saturation:CGFloat = 1.0
    
    init(name:String,color:UIColor){
        self.color = color
        self.name = name
    }
}


class ColorModel{
    var colors = [ColorEntry]()
    init(){
        colors = []
    }
    func hues(count:Int)->[ColorEntry]{
        colors = []
        if count <= 0 {return colors}
        for hue in 0...count{
            let hueValue = CGFloat(hue)/CGFloat(count)
            let color = UIColor(hue: hueValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            let name = String(format:"H:%04.3f S:1.0 B:1.0 ",hueValue)
            let colorEntry = ColorEntry(name: name, color: color)
            colors += [colorEntry]
        }
        return colors
    }
    
    func lightnessScale(hue:UIColor,count:Int){
        
    }
    
}

class ColorTableViewController:UITableViewController{
    
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
        //cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        title = colors[row].name
    }
    
    override func loadView() {
        super.loadView()
    }
    
}

let vc = ColorTableViewController()
PlaygroundPage.current.liveView = vc

