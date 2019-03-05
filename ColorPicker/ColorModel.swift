//
//  ColorModel.swift
//  ColorPicker
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//

import UIKit

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
    
    func rgbString()->String{
        var rgb = ""
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        rgb = String(format:"R:%04.3f G:%04.3f B:%04.3f",red,green,blue)
        return rgb
    }
    
    func hsbString()->String{
        var hsb = ""
        var alpha:CGFloat = 0
        
        
        hsb = String(format:"H:%04.3f S:%04.3f B:%04.3f",hue,saturation,brightness)
        return hsb
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
