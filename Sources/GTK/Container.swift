import CGTK

public class Container: Widget {

    public private(set) var children: [Widget] = []

    public var borderWidth: Int {
        get {
            Int(gtk_container_get_border_width(dynamicPointer()))
        } set {
            precondition(newValue >= 0, "You can't set a negative border width.")
            gtk_container_set_border_width(dynamicPointer(), UInt32(newValue))
        }
    }
    
    public func add(_ child: Widget) {
        precondition(child.parent == nil, "You can't add a widget to multiple containers.")
        gtk_container_add(dynamicPointer(), child.pointer)
        children.append(child)
        child.parent = self
    }

    func link(_ child: Widget) {
        precondition(child.parent == nil, "You can't add a widget to multiple containers.")
        children.append(child)
        child.parent = self
    }

    public func remove(_ child: Widget) {
        precondition(child.parent == self, "You can't remove a widget from a container that isn't its parent.")
        gtk_container_remove(dynamicPointer(), child.pointer)
        children.remove(at: children.firstIndex(of: child)!)
        child.parent = nil
    }
}
