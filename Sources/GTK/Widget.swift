import CGTK

public class Widget {

    let pointer: UnsafeMutablePointer<GtkWidget>

    func dynamicPointer<T>() -> UnsafeMutablePointer<T> {
        UnsafeMutableRawPointer(pointer).bindMemory(to: T.self, capacity: 1)
    }

    public weak var parent: Container?

    init(_ pointer: UnsafeMutablePointer<GtkWidget>) {
        self.pointer = pointer
        g_object_ref_sink(pointer)

        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
            sender, data in
            print("destroy")
        }

        g_signal_connect_data(
            pointer, "destroy",
            unsafeBitCast(handler, to: GCallback.self),
            nil, nil, GConnectFlags(0)
        )
    }

    deinit {
        print("denit \(self)")
        g_object_unref(pointer)
    }
    
    public func showAll() {
        gtk_widget_show_all(pointer)
    }
}

extension Widget: Equatable {

    public static func ==(lhs: Widget, rhs: Widget) -> Bool {
        lhs === rhs
    }
}
