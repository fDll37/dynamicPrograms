final class FindIslands {
    
    private var map: [[Point]] = []
    private var countIsland: Int = 0
    
    func bigIsland(size: Int, values: [Int]) -> Int {
        map = buildMap(size: size, values: values)
        countIsland = 0

        for y in 0..<size {
            for x in 0..<size {
                if map[x][y].value == 1 && map[x][y].state == .notVisited {
                    countIsland += 1
                    bfs(start: map[x][y])
                }
            }
        }
        
        return countIsland
    }
    
    private func bfs(start: Point) {
        let queue = Queue<Point>()
        queue.enqueue(start)
        
        while let current = queue.dequeue() {
            let x = current.x
            let y = current.y
            
            // Если уже посещено или это не часть острова, пропускаем
            if map[x][y].state == .visited {
                continue
            }
            
            if map[x][y].value == 0 {
                map[x][y].state = .visited
                continue
            }
            
            // Помечаем текущую точку как посещённую
            map[x][y].state = .visited
            
            // Проверяем верхнюю соседнюю клетку
            if x - 1 >= 0 && map[x - 1][y].state == .notVisited {
                queue.enqueue(map[x - 1][y])
            }
            
            // Проверяем нижнюю соседнюю клетку
            if x + 1 < map.count && map[x + 1][y].state == .notVisited {
                queue.enqueue(map[x + 1][y])
            }
            
            // Проверяем левую соседнюю клетку
            if y - 1 >= 0 && map[x][y - 1].state == .notVisited {
                queue.enqueue(map[x][y - 1])
            }
            
            // Проверяем правую соседнюю клетку
            if y + 1 < map.count && map[x][y + 1].state == .notVisited {
                queue.enqueue(map[x][y + 1])
            }
        }
    }
    
    private func buildMap(size: Int, values: [Int]) -> [[Point]] {
        var currentIndex = 0
        var map: [[Point]] = []
        
        for y in 0..<size {
            var levelPoints: [Point] = []
            let levelValues = Array(values[currentIndex..<currentIndex + size])
            for (x, value) in levelValues.enumerated() {
                levelPoints.append(Point(x: x, y: y, value: value))
            }
            
            map.append(levelPoints)
            currentIndex += size
        }
        
        return map
    }
}

// Состояние точки
enum StatePoint {
    case visited
    case notVisited
}

// Структура точки
struct Point {
    var state: StatePoint = .notVisited
    let x: Int
    let y: Int
    let value: Int
}
