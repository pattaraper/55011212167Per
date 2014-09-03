class TipCalculator{
    
    //2
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    //3
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    //4
    func calcTipWithTipPct(tipPct:Double) ->Double{
        return subtotal * tipPct
    }
    
    //1
    func returnPossibleTips() -> [Int: Double]{
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipExplicit:[Double] = [0.15, 0.18, 0.20]
        
        //2
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip*100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

//6
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.returnPossibleTips()
//

let array:Array<Int> = [1,2,3,4]
let dictionary:Dictionary<String,Int> = ["dog":1,"elepphant":2]

var airports:[String:String] = ["TY0":"Tokyo","DUB":"Dublin"]

if (airports.isEmpty) {
    println("The airport dictionary is Empty")
}
else{
    println("The airport dictionary is not Empty")
}


//Update Dictionary

airports["LHR"] = "London"
airports["LHR"] = "London Heathow"

if let oldVa = airports.updateValue("Dublin", forKey: "DUB"){
    println(". . . >\(oldVa)")
}
else{
    println("< . . .")
}

///////////////////  work  สวนสัตว์  //////////////////////
class Zoo{
    let foodCh : String
    let foodAn : String
    var Animal: [String:String]=["Rabbit":"grass","crow":"grass","bird":"fruit","snake":"meat","fish":"hydrophyte"]
    
    
    init(foodAn:String,foodCh:String){
        self.foodAn = foodAn
        self.foodCh = foodCh
    }
    
    func selectfood(foodAn:String)->String{
        var food = Animal[foodAn]
        return food!
    }
    
    func change(foodAn:String,foodCh:String){
        Animal[foodAn] = foodCh
    }
    
}
let importanimal = Zoo(foodAn: "bird", foodCh: "grass")
importanimal.selectfood("bird")
importanimal.change("bird", foodCh: "grass")


importanimal.selectfood("Rabbit")
importanimal.change("Rabbit", foodCh: "meat")


println(importanimal.Animal)

