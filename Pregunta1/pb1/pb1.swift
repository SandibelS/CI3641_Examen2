func f(n : Int ) -> Int{

    if n % 2 == 0{
        return n / 2
    }

    return 3 * n + 1
}

func count(n : Int) -> Int{

    var nn = n
    var m = 0
    while (nn > 1){
        nn = f(n : nn)
        m += 1
    }

    return m
}
