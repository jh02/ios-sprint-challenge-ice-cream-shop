import UIKit

struct Flavor {
    var name: String
    var rating: Double
}

enum Size: Double {
    case small = 3.99
    case medium = 4.99
    case large = 5.99
}


struct Cone {
    let flavor: Flavor
    let topping: String?
    let size: Size
    
    func eat() {
        print(" MMMMM...\(flavor.name) is my favorite flavor.")
    }
}

class IceCreamShop {
    var flavors: [Flavor]
    var sizes: [Size]
    var toppings: [String]
    var totalSales: Double
    
    init(externalflavors: [Flavor], externalsizes: [Size], externaltoppings: [String]) {
        self.flavors = externalflavors
        self.sizes = externalsizes
        self.toppings = externaltoppings
        self.totalSales = 0.0
    }
    
    func listTopFlavors() {
        for flavor in flavors {
            if flavor.rating > 4.0 {
                print("Our top flavors are \(flavor.name)")
            }
        }
    }
    
    func orderCone(flavor: Flavor, topping: String?, size: Size) -> Cone? {
       
       let order = Cone(flavor: flavor, topping: topping, size: size)
        
        totalSales += order.size.rawValue
        
        if let topping = order.topping {
            print("Your \(order.flavor.name) with \(topping) is \(order.size.rawValue)")
        } else {
            print("Your \(order.flavor.name) is \(order.size.rawValue)")
        }
        
        return order
    }
}


let strawberry = Flavor(name: "Strawberry", rating: 3.0)
let chocolate = Flavor(name: "Chocolate", rating: 4.3)
let vanilla = Flavor(name: "Vanilla", rating: 3.9)
let cherry = Flavor(name: "Cherry", rating: 1.0)
let rockyRoad = Flavor(name: "Rocky Road", rating: 4.5)

let sizes: [Size] = [.small, .medium, .large]

var flavors = [strawberry, chocolate, vanilla, cherry, rockyRoad]
var toppings = ["fudge", "whipped cream", "nuts", "cheesecake bits", "gummy bears"]

let myShop = IceCreamShop(externalflavors: flavors, externalsizes: sizes, externaltoppings: toppings)

myShop.listTopFlavors()



let myOrder = myShop.orderCone(flavor: strawberry, topping: nil, size: .large)

myOrder?.eat()

print(myShop.totalSales)

let cone = myShop.orderCone(flavor: chocolate, topping: toppings[4], size: .medium)

cone?.eat()

print(myShop.totalSales)



