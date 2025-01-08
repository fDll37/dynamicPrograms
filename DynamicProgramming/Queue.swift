final class Queue<T> {
    
    private var elements: [T] = []

    func enqueue(_ value: T) {
        elements.append(value)
    }
    
    func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
}
