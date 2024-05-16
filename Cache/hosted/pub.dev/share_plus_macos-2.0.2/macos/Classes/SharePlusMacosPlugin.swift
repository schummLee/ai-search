import Cocoa
import FlutterMacOS

public class SharePlusMacosPlugin: NSObject, FlutterPlugin, NSSharingServicePickerDelegate {
  private var subject: String?
  private var registrar: FlutterPluginRegistrar

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dev.fluttercommunity.plus/share", binaryMessenger: registrar.messenger)
    let instance = SharePlusMacosPlugin(registrar: registrar)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  init(registrar: FlutterPluginRegistrar) {
    self.registrar = registrar
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as! [String: Any]
    let origin = originRect(args)

    switch call.method {
    case "share":
      let text = args["text"] as! String
      let subject = args["subject"] as? String
      shareItems([text], subject: subject, origin: origin, view: registrar.view!)
      result(true)
    case "shareFiles":
      let paths = args["paths"] as! [String]
      let urls = paths.map { NSURL.fileURL(withPath: $0) }
      shareItems(urls, origin: origin, view: registrar.view!)
      result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func sharingServicePicker(_ sharingServicePicker: NSSharingServicePicker, delegateFor sharingService: NSSharingService) -> NSSharingServiceDelegate? {
    sharingService.subject = subject
    return sharingService.delegate
  }

  private func shareItems(_ items: [Any], subject: String? = nil, origin: NSRect, view: NSView) {
    let picker = NSSharingServicePicker(items: items)
    picker.delegate = self
    self.subject = subject
    picker.show(relativeTo: origin, of: view, preferredEdge: NSRectEdge.maxY)
  }

  private func originRect(_ args: [String: Any]) -> NSRect {
    let x = CGFloat(args["originX"] as? Double ?? 0)
    let y = CGFloat(args["originY"] as? Double ?? 0)
    let width = CGFloat(args["originWidth"] as? Double ?? 0)
    let height = CGFloat(args["originHeight"] as? Double ?? 0)
    return NSMakeRect(x, y, width, height)
  }
}
