import Foundation

struct Stack<E> {
    private var array = [E]()

    mutating func push( x: E) {
        array.append(x)
    }

    mutating func pop() -> E?  
 {
        return array.popLast()
    }

    var isEmpty: Bool {
        return array.isEmpty  

    }

    var peek: E? {
        return array.last
    }

    var count: Swift.Int {
        return array.count
    }
}

func postFix(arr : ArraySlice<Substring>) -> Int{

    var stack = Stack<Int>()

    for str in arr {

        if let num = Int(str) {
            
            stack.push(x : num)

        } else {

            if stack.count < 2 {
                print("Error: faltan operandos")
                exit(1)
            }

            switch str {
            case "+":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val1! + val2!

                stack.push(x : valNew)

            case "-":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val2! - val1!

                stack.push(x : valNew)

            case "*":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val1! * val2!

                stack.push(x : valNew)

            case "/":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val1! / val2!

                stack.push(x : valNew)

            default:
                print("Error: '\(str)'caracter invalido ")
                exit(1)  
            }
        }
    }

    if stack.count != 1 {
        print("Error: faltan operadores")
        exit(1)
    }

    return stack.pop()!

}

func preFix(arr : ArraySlice<Substring>) -> Int {

    var stack = Stack<Int>()

    for str in arr.reversed() {
        if let num = Int(str) {
            
            stack.push(x : num)

        } else {

            if stack.count < 2 {
                print("Error: faltan operandos")
                exit(1)
            }

            switch str {
            case "+":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val1! + val2!

                stack.push(x : valNew)

            case "-":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val2! - val1!

                stack.push(x : valNew)

            case "*":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val1! * val2!

                stack.push(x : valNew)

            case "/":

                let val1 = stack.pop()
                let val2 = stack.pop()

                let valNew = val1! / val2!

                stack.push(x : valNew)

            default:
                print("Error: '\(str)'caracter invalido ")
                exit(1)  
            }
        }
    }

    if stack.count != 1 {
        print("Error: faltan operadores")
        exit(1)
    }

    return stack.pop()!

}

func postFixView(arr : ArraySlice<Substring>) -> String{

    var strStack = Stack<String>()

    for str in arr {

        if Int(str) != nil{
            
            strStack.push(x : String(str))

        } else {

            if strStack.count < 2 {
                print("Error: faltan operandos")
                exit(1)
            }

            switch str {
            case "+":

                let val2 = strStack.pop()
                let val1 = strStack.pop()

                strStack.push(x : "(\(val1!) + \(val2!))")

            case "-":

                let val2 = strStack.pop()
                let val1 = strStack.pop()

                strStack.push(x : "(\(val1!) - \(val2!))")


            case "*":

                let val2 = strStack.pop()
                let val1 = strStack.pop()

                strStack.push(x : "(\(val1!) * \(val2!))")


            case "/":

                let val2 = strStack.pop()
                let val1 = strStack.pop()

                strStack.push(x : "(\(val1!) / \(val2!))")

            default:
                print("Error: '\(str)'caracter invalido ")
                exit(1)  
            }
        }
    }
    
    return strStack.pop()!

}

func preFixView(arr : ArraySlice<Substring>) -> String {


    var strStack = Stack<String>()

    for str in arr.reversed() {

        if Int(str) != nil{
            
            strStack.push(x : String(str))

        } else {

            if strStack.count < 2 {
                print("Error: faltan operandos")
                exit(1)
            }

            switch str {
            case "+":

                let val1 = strStack.pop()
                let val2 = strStack.pop()

                strStack.push(x : "(\(val1!) + \(val2!))")

            case "-":

                let val1 = strStack.pop()
                let val2 = strStack.pop()

                strStack.push(x : "(\(val1!) - \(val2!))")


            case "*":

                let val1 = strStack.pop()
                let val2 = strStack.pop()

                strStack.push(x : "(\(val1!) * \(val2!))")


            case "/":

                let val1 = strStack.pop()
                let val2 = strStack.pop()

                strStack.push(x : "(\(val1!) / \(val2!))")

            default:
                print("Error: '\(str)'caracter invalido ")
                exit(1)  
            }
        }
    }
    
    return strStack.pop()!

}


func main(){

    var keepRunning = true

    while keepRunning {

        if let input = readLine() {

            let split_input = input.split(separator: " ")

            if (split_input.count >= 5 && split_input[0] == "EVAL") {

                if split_input[1] == "PRE" {

                   print(preFix(arr : split_input[2...]))

                }

                if split_input[1] == "POST" {

                    print(postFix(arr : split_input[2...]))
                    
                }

            } else if (split_input.count >= 5 && split_input[0] == "MOSTRAR") {

                if split_input[1] == "PRE" {

                    print(preFixView(arr : split_input[2...]))

                }

                if split_input[1] == "POST" {

                    print(postFixView(arr : split_input[2...]))
                    
                }

            } else if (split_input.count > 0 && split_input[0] == "SALIR") {

                keepRunning = false 

            } else {

                print("Accion no reconocida")

            }
        }
        
    }
    
    

}
