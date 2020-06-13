public struct Size {

    public var width: Int
    public var height: Int

    public init(width: Int = 0, height: Int = 0) {
        self.width = width
        self.height = height
    }
}

extension Size: CustomStringConvertible {

    public var description: String {
        "(w: \(width), h: \(height))"
    }
}
