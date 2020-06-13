import CGTK

public private(set) var topLevelWindows: [Window] = []

public class Window: Bin {

    public enum `Type` {

        case topLevel
        case popUp

        func toGTK() -> GtkWindowType {
            switch self {
            case .topLevel:
                return GTK_WINDOW_TOPLEVEL
            case .popUp:
                return GTK_WINDOW_POPUP
            }
        }
    }

    override init(_ pointer: UnsafeMutablePointer<GtkWidget>) {
        super.init(pointer)
        topLevelWindows.append(self)

        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
            sender, data in
            let window = Unmanaged<Window>.fromOpaque(data).takeUnretainedValue()
            topLevelWindows.remove(at: topLevelWindows.firstIndex(of: window )!)
        }

        g_signal_connect_data(
            pointer, "destroy",
            unsafeBitCast(handler, to: GCallback.self),
            Unmanaged.passUnretained(self).toOpaque(),
            nil, GConnectFlags(0)
        )
    }

    public convenience init(_ type: Type = .topLevel) {
        self.init(gtk_window_new(type.toGTK()))
    }

    public weak var application: Application? {
        didSet {
            if let application = application, oldValue == nil {
                gtk_application_add_window(application.pointer, dynamicPointer())
            } else if let oldValue = oldValue, application == nil {
                gtk_application_remove_window(oldValue.pointer, dynamicPointer())
            }
        }
    }

    public var defaultSize: Size {
        get {
            var width: Int32 = 0
            var height: Int32 = 0
            gtk_window_get_default_size(dynamicPointer(), &width, &height)
            return Size(width: Int(width), height: Int(height))
        }
        set {
            gtk_window_set_default_size(dynamicPointer(), Int32(newValue.width), Int32(newValue.height))
        }
    }
    
    public var title: String {
        get {
            gtk_window_get_title(dynamicPointer()).toString
        }
        set {
            gtk_window_set_title(dynamicPointer(), newValue)
        }
    }

    public func close() {
        gtk_window_close(dynamicPointer())
    }
}
