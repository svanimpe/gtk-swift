import GTK

let app = Application(id: "org.gtk.example")
app.onActivate = { application in
    let window = ApplicationWindow(for: application)
    window.title = "Window"
    window.borderWidth = 10

    let grid = Grid()
    window.add(grid)

    func printHello(sender: Button) {
        print("Hello World")
    }

    let button1 = Button(label: "Button1")
    button1.onClick = printHello
    grid.attach(button1, row: 0, column: 0)
    
    let button2 = Button(label: "Button2")
    button2.onClick = printHello
    grid.attach(button2, row: 0, column: 1)

    let quit = Button(label: "Quit")
    quit.onClick = { [unowned window] _ in
        window.close()
    }
    grid.attach(quit, row: 1, column: 0, columnSpan: 2)

    window.showAll()
}
app.run()
