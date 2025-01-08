final class DynamicProgramms {
    
    static func ones(n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        
        return ones(n: n >> 1) + (n & 1)
    }
    
    static func maxLengthUp(values: [Int]) -> Int {
        var length: [Int] = Array(repeating: 0, count: values.count)
        length[0] = 1
        var max = 1
        
        for i in 1..<values.count {
            length[i] = 1
            
            for j in 0..<i {
                if values[i] > values[j] {
                    let len = length[j] + 1
                    
                    if len > length[i] {
                        length[i] = len
                        
                        if len > max {
                            max = len
                        }
                    }
                }
            }
        }
        return max
    }
    
    static func christmasTree(height: Int, values: [Int]) -> Int {
        var tree = buildTree(values: values, height: height)
        
        for level in stride(from: height - 2, through: 0, by: -1) {
            for index in 0..<tree[level].count {
                tree[level][index] += max(tree[level + 1][index], tree[level + 1][index + 1])
            }
        }

        return (tree[0]).max()!
    }
    
    private static func buildTree(values: [Int], height: Int) -> [[Int]] {
        var tree: [[Int]] = []
        var currentIndex = 0
        
        for level in 1...height {
            let levelValues = Array(values[currentIndex..<currentIndex + level])
            tree.append(levelValues)
            currentIndex += level
        }
        
        return tree
    }
    
    static func oneTwo(values: String) -> String {
        let paths = values.split(separator: "+")
        let a = Int(paths[0].split(separator: "/")[0])!
        let b = Int(paths[0].split(separator: "/")[1])!
        let c = Int(paths[1].split(separator: "/")[0])!
        let d = Int(paths[1].split(separator: "/")[1])!
        
        let upValue = (a * d + c * b)
        let downValue = b * d
        
        let gcd = gcd(m: upValue, n: downValue)
        
        return "\(upValue / gcd)/\(downValue / gcd)"
    }
    
    private static func gcd(m: Int, n: Int) -> Int {
        if n == 0 || m == 0 { return 1}
        if m == n { return m }
        if m > n {
            return gcd(m: m - n, n: n)
        } else {
            return gcd(m: n - m, n: m)
        }
    }
    
    static func countNumbersWithoutThreeInRow(N: Int) -> Int {
        if N == 1 { return 2 }

        var prev0 = 2
        var prev1 = 0

        for _ in 2...N {
            let current0 = prev0 + prev1
            let current1 = prev0
            prev0 = current0
            prev1 = current1
        }

        return prev0 + prev1
    }
}
