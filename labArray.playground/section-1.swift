
class labclass{
    var num =  [1,5,7,9,4,3,2,8,6,4]
    var checknum = 0
    var countnum = 0
    
    
    init (){
    }
    
    func checknums()->Int{
        countnum = num.count
        println("Count Array : \(countnum)")
        println(num)
        var summod = 0;
        var sult = 0;
        print( "This is a even number :" )
        for (var i=0 ; i < countnum ; i++){
            summod = num[i]%2
            if (summod==0){
                checknum = num[i]
                print("\t\(checknum)")
                sult++;
            }
        }
    return sult
    }
    
}
var abc = labclass()
println("\nEven Number = \(abc.checknums())")
