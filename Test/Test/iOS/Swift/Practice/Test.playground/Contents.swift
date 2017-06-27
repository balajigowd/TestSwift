//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Star
{
    var color : String?
    var distance : Float?
}

var objStar = Star()
objStar.color = "Test"
objStar.distance = 2.00;

var objStar2 = objStar;
objStar2.color = "color";

print(objStar.color);