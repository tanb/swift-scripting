import Foundation
import GCDWebServer

let person = Person(name: "tanB")
person.say()
person.getRequest()

// while true {
//     NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 1))
// }

autoreleasepool {
    let webServer = GCDWebServer()
    let response = "<html><body><p>Hello World</p></body></html>"
    var processBlock: GCDWebServerProcessBlock = { (request) in
        return GCDWebServerDataResponse(HTML: response)
    }

    webServer.addDefaultHandlerForMethod("GET",
                                         requestClass: GCDWebServerRequest.self,
                                         processBlock: processBlock)

    webServer.runWithPort(8080, bonjourName:nil);
    print("Visit %@ in your web browser \(webServer.serverURL)");
}
