import Cocoa

let detail = NSURLComponents(string: "myapp://detail?key=value")!
let master = NSURLComponents(string: "myapp://master")!

detail.scheme
master.scheme

detail.host
master.host

let queryItem = detail.queryItems![0]

if detail.scheme == "myapp" {
    print(#line, "my scheme is myapp")
}
