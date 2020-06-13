import CGTK

public class Application {

    let pointer: UnsafeMutablePointer<GtkApplication>

    func dynamicPointer<T>() -> UnsafeMutablePointer<T> {
        UnsafeMutableRawPointer(pointer).bindMemory(to: T.self, capacity: 1)
    }

    public init(id: String) {
        pointer = gtk_application_new(id, G_APPLICATION_FLAGS_NONE)

        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = {
            sender, data in
            let application = Unmanaged<Application>.fromOpaque(data).takeUnretainedValue()
            application.onActivate(application)
        }

        g_signal_connect_data(
            pointer, "activate",
            unsafeBitCast(handler, to: GCallback.self),
            Unmanaged.passUnretained(self).toOpaque(),
            nil, GConnectFlags(0)
        )
    }
    
    public var onActivate: (Application) -> Void = { _ in }

    @discardableResult
    public func run() -> Int32 {
        let status = g_application_run(dynamicPointer(), CommandLine.argc, CommandLine.unsafeArgv)
        g_object_unref(pointer)
        return status
    }
}
