import UIKit

protocol A {
    var number : Int {get set}
}

class AClass : A {
    var number: Int = 0
}

let a = AClass()
print(a.number)

