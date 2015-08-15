//
// Script.swift
//

// Read CSV file by SwiftCSV
import SwiftCSV
let delimiter = NSCharacterSet(charactersInString: ",")
let encoding = NSUTF8StringEncoding

let filepath = NSFileManager().currentDirectoryPath + "/docs/sample.csv"
let data: NSData! = NSData(contentsOfFile: filepath)
let content: String! = NSString(data: data, encoding:NSUTF8StringEncoding) as! String


func printTotal(csv: SwiftCSV.CSV!, column: String!) {
    let _models = csv.columns[column]
    if _models == nil {
        print("no column: \(column)");
        return;
    }

    let models = _models!
    var modelsData: Dictionary! = [String: Int]()
    for model in models {
        if let value = modelsData[model] {
            modelsData[model] = value + 1
        } else {
            modelsData[model] = 1
        }
    }

    print(modelsData)
}

// main
do {
    let csv = try SwiftCSV.CSV(content: content, delimiter: delimiter, encoding: encoding)
    printTotal(csv, column: "model")
    printTotal(csv, column: "type")
} catch {
    print("Caught error")
}
