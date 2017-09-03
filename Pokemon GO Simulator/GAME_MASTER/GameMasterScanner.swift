import Foundation

/// A type that scans item templates from the GAME_MASTER text.
public class GameMasterScanner {
	
	typealias My = GameMasterScanner
	
	static let keyValueRegex = try! NSRegularExpression(pattern: "\\w+: .+")
	
	static let templateRegex = try! NSRegularExpression(pattern: "\\w+ \\{")
	
	class ReadHead {
		
		var lineNumber = 0
		
		let lines: [String]
		
		init(text: String) {
			lines = text.components(separatedBy: "\n")
		}
		
		func nextLine() -> String? {
			guard lineNumber < lines.count else {
				return nil
			}
			defer { lineNumber += 1 }
			return lines[lineNumber]
		}
	}
	
	enum State : Int {
		case topLevel, itemTemplates
	}
	
    /// Returns an array of item templates scanned from the GAME_MASTER text.
	public func scanGameMaster(_ text: String) -> [ItemTemplate] {
		let head = ReadHead(text: text)
		
		var templates = [ItemTemplate]()
		while let line = head.nextLine() {
			if line == "item_templates {" {
				let template = scanItemTemplate(from: head)
                templates.append(template)
			}
		}
		
		return templates
	}
	
	func scanItemTemplate(from head: ReadHead) -> ItemTemplate {
		var template: ItemTemplate = [:]
		while var line = head.nextLine() {
            line = String(line.drop(while: { $0 == " "}))
			if line == "}" {
                // The template has been fully scanned
                break
			}
			else if My.keyValueRegex.firstMatch(in: line, options: [], range: NSMakeRange(0, line.count)) != nil {
				let parts = line.components(separatedBy: ": ")
				let key = parts[0]
				let value = parts[1]
				template[key] = .string(value)
			}
			else if My.templateRegex.firstMatch(in: line, options: [], range: NSMakeRange(0, line.count)) != nil {
				let parts = line.components(separatedBy: " ")
				let key = parts[0]
				let value = scanItemTemplate(from: head)
				template[key] = .template(value)
			}
		}
		return template
	}
}
