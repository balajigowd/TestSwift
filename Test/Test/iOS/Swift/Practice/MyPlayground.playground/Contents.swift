protocol classa {
    
    var marks: Int { get set }
    var result: Bool { get }
    
    func attendance() -> String
    func markssecured() -> String
    
}

protocol classb: classa {
    
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
    
}

class classc: classb {
    var marks = 96
    let result = true
    var present = false
    var subject = "Swift Protocols"
    var stname = "Protocols"
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func markssecured() -> String {
        return "\(stname) has scored \(marks)"
    }
}

let studdet = classc()
studdet.stname = "Swift"
studdet.marks = 98
studdet.markssecured()

print(studdet.marks)
print(studdet.result)
print(studdet.present)
print(studdet.subject)
print(studdet.stname)
//When we run the above program using playground, we get the following result −

98
true
false
//Swift Protocols
//Swift
//Mutating Method Requirements
protocol daysofaweek {
    mutating func print()
}

enum days: daysofaweek {
    case sun, mon, tue, wed, thurs, fri, sat
    mutating func print() {
        switch self {
        case sun:
            self = sun
            print("Sunday")
        case mon:
            self = mon
            println("Monday")
        case tue:
            self = tue
            println("Tuesday")
        case wed:
            self = wed
            println("Wednesday")
        case mon:
            self = thurs
            println("Thursday")
        case tue:
            self = fri
            println("Friday")
        case sat:
            self = sat
            println("Saturday")
        default:
            println("NO Such Day")
        }
    }
}

var res = days.wed
res.print()
