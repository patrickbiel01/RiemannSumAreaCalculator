import UIKit
import Darwin


/* Interfacing Function:
    Performs left-bound & right-bound riemann sum
    => Takes average of 2 to get area
 */
func areaof(_ f: (Double) -> Double, between low: Double, and high: Double) -> Double {
    let leftA = estimateReimann(f, between: low, and: high, left: true)
    let rightA = estimateReimann(f, between: low, and: high, left: false)
    let area = (leftA + rightA) / 2
    return area
}
//Funtion that calculates the area b/w a curve and y=0 using small riemann sums
func estimateReimann(_ f: (Double) -> Double, between low: Double, and high: Double, left: Bool) -> Double {
    let RECT_LEN = 0.001
    
    var area: Double = 0
    let LIMIT: Int = Int(Double(high - low) / RECT_LEN)
    
    for i in 0..<LIMIT {
        var y = 0.0
        let x1: Double = Double(low) + Double(i)*RECT_LEN
        if left {
            y = f(x1)
        }else {
            let x2 = x1 + RECT_LEN
            y = f(x2)
        }
        let rectArea = y*RECT_LEN
        area += rectArea
    }
    
    return area
}

////// USAGE //////
let area = areaof(
    { x in
        return sin(x)
    },
    between: 0.0,
    and: Double.pi
)
print(area) // ~2
