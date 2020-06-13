import CGTK

public class Bin: Container {

    public var child: Widget? {
        get {
            children.first
        }
        set {
            if newValue == child {
                return
            }
            if let currentChild = child {
                remove(currentChild)
            }
            if let newChild = newValue {
                add(newChild)
            }
        }
    }

    public override func add(_ child: Widget) {
        precondition(children.isEmpty, "You can't add more than one widget to a Bin.")
        super.add(child)
    }
}
