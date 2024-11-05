
func merge(arr : inout [Int], left : Int, mid : Int, right : Int) {

    let n1 = mid - left + 1
    let n2 = right - mid

    var L = [Int]()
    var R = [Int]()

    for i in 0..<n1 {
        L.append(arr[left + i])
    } 

    for i in 0..<n2 {
        R.append(arr[mid + 1 + i])
    } 

    var i = 0
    var j = 0
    var k = left

    while (i < n1 && j < n2){
        if L[i] <= R[j]{
            arr[k] = L[i]
            i += 1
        }
        else {
            arr[k] = R[j]
            j += 1
        }
        k += 1
    }

    while i < n1 {
        arr[k] = L[i]
        i += 1
        k += 1
    }

    while j < n2 {
        arr[k] = R[j]
        j += 1
        k += 1
    }
}

func mergesort (arr : inout [Int], left : Int, right : Int){

    if left >= right {
        return
    }

    let mid = left + (right - left) / 2

    mergesort(arr : &arr, left : left, right : mid )
    mergesort(arr : &arr, left : mid + 1, right: right)
    merge(arr : &arr, left: left, mid : mid, right : right)
}
