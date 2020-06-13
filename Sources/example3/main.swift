// import CGTK
// import Utilities

// /*
//  Either run this example from the command line, or when using Xcode,
//  edit the scheme and set the working directory to the project's root directory
//  so the "builder.ui" file can be found.
//  */

// func printHello(widget: UnsafeMutablePointer<GtkWidget>, data: gpointer?) {
//     print("Hello World")
// }

// var error: UnsafeMutablePointer<GError>? = nil

// // Because gtk_init can mutate argc and argv, we need to copy them to variables.
// var argc = CommandLine.argc
// // gtk_init expects an *optional* pointer, so we need an explicit type annotation.
// var argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>? = CommandLine.unsafeArgv
// gtk_init(&argc, &argv)

// let builder = gtk_builder_new()!
// if gtk_builder_add_from_file(builder, "Sources/example3/builder.ui", &error) == 0 {
//     print("Error loading file: \(error!.pointee.message!.toString))")
//     g_clear_error(&error)
//     exit(1)
// }

// let window = gtk_builder_get_object(builder, "window")!
// g_signal_connect(window, "destroy", gtk_main_quit, nil)

// var button = gtk_builder_get_object(builder, "button1")!
// g_signal_connect(button, "clicked", g_callback_widget_data(printHello), nil)

// button = gtk_builder_get_object(builder, "button2")!
// g_signal_connect(button, "clicked", g_callback_widget_data(printHello), nil)

// button = gtk_builder_get_object(builder, "quit")!
// g_signal_connect(button, "clicked", gtk_main_quit, nil)

// gtk_main()

// exit(0)
