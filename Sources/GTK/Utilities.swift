import CGTK

public extension UnsafePointer where Pointee == gchar {
    
    /// Returns this `gchar` pointer as a `String`.
    var toString: String {
        String(cString: self)
    }
}

public extension UnsafeMutablePointer where Pointee == gchar {
    
    /// Returns this `gchar` pointer as a `String`.
    var toString: String {
        String(cString: self)
    }
}
