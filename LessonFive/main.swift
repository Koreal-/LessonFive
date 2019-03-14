//
//  main.swift
//  LessonFive
//
//  Created by imac on 12/03/2019.
//  Copyright © 2019 kstudio. All rights reserved.
//

import Foundation

print("Hello, Master!")
enum WindowsOpen {
    case open
    case close
}
enum Transmission {
    case auto
    case mech
}
protocol CarSinceChange {
    //func changeWidowsState() ->Bool
    //func changeEngineState() ->Bool
    func sinceChange()
    
}
extension CarSinceChange {
    func sinceChange() {
        //since = sinceChange - не понимаю как передавать переменную since, где ошибка, подскажите пожалуйста
    }
}
extension CarInfo {
    func changeWidowsState() -> Bool {
        
        if windowsOpen == true{
            print("окна открыты - \(windowsOpen)\n")
            return windowsOpen
        }
        else{
            print("окна закрыты - \(windowsOpen)\n")
            return windowsOpen
        }
    }
}
extension CarInfo {
    func changeEngineState() ->Bool {
        if engineOn == true{
            print("двигатель запущен - \(engineOn)\n")
            return engineOn
        }
        else{
            print("двигатель остановлен - \(engineOn)\n")
            return engineOn
        }
    }
}

protocol SportCarCharacter: CustomStringConvertible {
    func printDescription()
}
extension SportCarCharacter {
    func printDescription() {
        print(description)
    }
}

class CarInfo: CarSinceChange {
    var mark : String
    var since : Float
    var trunk : Int
    var engineOn : Bool
    var windowsOpen : Bool
    var fullTrunk : Float
    
    init(mark : String, since: Float, trunk: Int, engineOn: Bool, windowsOpen: Bool, fullTrunk: Float){
        self.mark = mark
        self.since = since
        self.trunk = trunk
        self.engineOn = engineOn
        self.windowsOpen = windowsOpen
        self.fullTrunk = fullTrunk
    }
}


// Другие классы
class TrunkCar: CarSinceChange {
    var engineOn : Bool
    var windowsOpen : Bool
    var price: Int
    var weight: Int
    var trunk: Int
    var since: Float
    var weightTrunk: String
    
    init(price: Int, weight: Int, trunk: Int, since: Float, engineOn: Bool, windowsOpen: Bool, weightTrunk: String){
        self.engineOn = engineOn
        self.windowsOpen = windowsOpen
        self.price  = price
        self.weight = weight
        self.trunk = trunk
        self.since = since
        self.weightTrunk = weightTrunk
    }
    
}
class SportСar: CarSinceChange, SportCarCharacter {
    var engineOn : Bool
    var windowsOpen : Bool
    var weight: Int
    var color: String
    var transmission: Transmission
    var maxSpeed: Int
    
    
    func otherTransmission() {
        transmission = transmission == .auto ? .mech : .auto
    }
    init(weight: Int, color: String, transmission: Transmission, engineOn: Bool, windowsOpen: Bool, maxSpeed: Int){
        self.engineOn = engineOn
        self.windowsOpen = windowsOpen
        self.weight = weight
        self.color = color
        self.transmission = transmission
        self.maxSpeed = maxSpeed
    }
    //var maxSpeed: Int
    func calculateMaxSpeed() -> Int {
        return 2 * maxSpeed % weight
    }
    /*init(maxSpeed: Int) {
     self.maxSpeed = maxSpeed
     }*/
    var description: String {
        return String(describing: maxSpeed)
    }
}

var transChange = SportСar(weight: 200, color: "white", transmission: .auto, engineOn: false, windowsOpen: false, maxSpeed: 120)
print(transChange)
print(transChange.transmission)
transChange.transmission = .mech
//sinceChange = CarInfo.since = 2019

print(transChange.transmission)

var sinceChange = CarInfo(mark: "Toyota", since: 1999, trunk: 800, engineOn: false, windowsOpen: true, fullTrunk: 10)
print(sinceChange.since)
sinceChange.since = 2018
print(sinceChange.since)
