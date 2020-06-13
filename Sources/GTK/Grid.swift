import CGTK

public class Grid: Container {

    public init() {
        super.init(gtk_grid_new())
    }

    public func attach(_ child: Widget, row: Int, column: Int, rowSpan: Int = 1, columnSpan: Int = 1) {
        precondition(child.parent == nil, "You can't add a widget to multiple containers.")
        gtk_grid_attach(dynamicPointer(), child.pointer,
                        Int32(column), Int32(row), Int32(columnSpan), Int32(rowSpan))
        link(child)
    }
}
