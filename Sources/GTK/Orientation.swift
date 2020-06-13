import CGTK

public enum Orientation {

    case horizontal
    case vertical

    func toGTK() -> GtkOrientation {
        switch self {
        case .horizontal:
            return GTK_ORIENTATION_HORIZONTAL
        case .vertical:
            return GTK_ORIENTATION_VERTICAL
        }
    }
}
