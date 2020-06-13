#include <termios.h>
#include <gtk/gtk.h>

/*
 In addition to including the GTK header, this header redefines macros that are needed for the tutorial,
 but aren't automatically imported into Swift as functions.
 */

/*
 The G_CALLBACK macro from GObject casts any function pointer to a GCallback (() -> Void).
 This relies on undefined behavior in C and isn't possible in Swift.
 The following section declares multiple functions to cast various callbacks to a GCallback.
 */
#undef G_CALLBACK
GCallback g_callback_two(void (*callback)(void *, void *)) {
    return (GCallback)callback;
}

GCallback g_callback_widget(void (*callback)(GtkWidget *)) {
    return (GCallback)callback;
}

GCallback g_callback_widget_data(void (*callback)(GtkWidget *, gpointer)) {
    return (GCallback)callback;
}

GCallback g_callback_app_data(void (*callback)(GtkApplication *, gpointer)) {
    return (GCallback)callback;
}
