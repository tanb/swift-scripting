import Alamofire

public class Person {
    let name: String

    public init(name: String) {
        self.name = name
    }

    public func say() {
        print("Hello, I'm \(self.name) !")
    }

    public func getRequest() {
        Alamofire.request(Alamofire.Method.GET, "http://tanb.me")
          .responseString { _, _, result in
                            print("Success: \(result.isSuccess)")
        }
    }
}
