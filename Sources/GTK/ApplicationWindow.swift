import CGTK

public class ApplicationWindow: Window {

    public init(for application: Application) {
        super.init(gtk_application_window_new(application.pointer))
        self.application = application
    }

    public var id: Int {
        Int(gtk_application_window_get_id(dynamicPointer()))
    }
}
