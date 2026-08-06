import Foundation

// 1. Access command-line arguments and environment
let args = ProcessInfo.processInfo.arguments
print("Running command: \(args[0])")

// 2. File Manager operations
let currentPath = FileManager.default.currentDirectoryPath
print("Current Working Directory: \(currentPath)")

// 3. Dates & Formatting
let now = Date()
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
print("Current Time: \(formatter.string(from: now))")

// 4. Encoding JSON data
struct Config: Codable {
    var version: String = "1.0.0"
    var debugMode: Bool = true
}

let config = Config()
if let jsonData = try? JSONEncoder().encode(config),
   let jsonString = String(data: jsonData, encoding: .utf8) {
    print("Generated Config JSON: \(jsonString)")
}