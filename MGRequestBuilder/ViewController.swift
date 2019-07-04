//
//  ViewController.swift
//  MGRequestBuilder
//
//  Created by zhao on 2018/3/15.
//  Copyright © 2018年 zhao. All rights reserved.
//

import Cocoa
class ViewController: NSViewController {
    
    var _classHString:String = ""
    var _classCPPString:String = ""
    
    var rootName : String {
        
        var lower = rootClassName.stringValue.lowercased()
        if let range = lower.range(of: "response") {
            lower.removeSubrange(range)
        }
        if let range = lower.range(of: "request") {
            lower.removeSubrange(range)
        }
        
        return classPrefix.stringValue + lower.capitalized
    }

    @IBOutlet weak var classPrefix: NSTextField!
    @IBOutlet var jsonTextView: NSTextView!
    @IBOutlet var headTextView: NSTextView!    
    @IBOutlet var sourceTextView: NSTextView!
    @IBOutlet weak var rootClassName: NSTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let string = "{\"bannerarray\":[{\"title\":\"打发打发士大夫\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/149509918146725251.png\",\"sharetitle\":\"打发士发大水法\",\"sharedescription\":\"范德萨发大水法法的萨芬\",\"url\":\"https://m-develop.migang.com/active/cxo66?source2=app\"},{\"title\":\"金秋\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/150063764879144114.jpg\",\"sharetitle\":\"米缸金融与安心互联网保险达成履约保证保险合作分享标题\",\"sharedescription\":\"米缸金融与（以下简称“安心互联网保险”）达成履约保证保险合作分享内容\",\"url\":\"https://m-develop.migang.com/active/cxo73?source2=app\"},{\"title\":\"瑞狗迎新春米缸贺新年\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/151840060198468676.jpg\",\"sharetitle\":\"瑞狗迎新春米缸贺新年\",\"sharedescription\":\"瑞狗迎新春米缸贺新年，回味2017，迎接2018\",\"url\":\"https://m-dev00.migang.com/active/cxo77?source2=app\"}],\"restmoney\":\"910.50\",\"productshow\":0}"
        //jsonTextView.textStorage?.setAttributedString(NSAttributedString(string: string))

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func didMake(_ sender: NSButton) {
        let string = jsonTextView.textStorage?.string
        let jsondata = string?.data(using: String.Encoding.utf8)
        let data =  try? JSONSerialization.jsonObject(with: jsondata!)
        
        if data != nil {
            let head = makefile(json: data).0
            let cpp = makefile(json: data).1
            
            headTextView.textStorage?.setAttributedString(NSAttributedString(string: head))
            sourceTextView.textStorage?.setAttributedString(NSAttributedString(string: cpp))
            let j = data as! Dictionary<String, Any>
            
        //jsonTextView.textStorage?.setAttributedString(NSAttributedString(string: j.debugDescription))
        }else{
            self.showAlertView(withtext: "Json数据无效")
        }
        
    }
    
    @IBAction func outputFile(_ sender: Any) {
        
//        let savepanel = NSSavePanel();
//        savepanel.title = "tiiiii"
//        savepanel.prompt = "ffffffffffffffffff"
//        savepanel.message = "mmmmmmmmmmmmmm"
//        savepanel.allowedFileTypes = [".h", ".cpp"]
//        savepanel.canCreateDirectories = true
//        savepanel.nameFieldLabel = "aaaa"
//
//
//        savepanel.beginSheetModal(for: NSApplication.shared.windows.first!) { (res) in
//            if res == NSApplication.ModalResponse.OK {
//                let thedoc = savepanel.url?.path
//                let hh = thedoc! + "/" + self.rootClassName.stringValue.capitalized + ".h"
//                let cpp = thedoc! + "/" + self.rootClassName.stringValue.capitalized + ".cpp"
//                do {
//                    try self._classHString.write(toFile: hh, atomically: false, encoding: String.Encoding.utf8)
//
//                }catch let erro {
//                    print(erro)
//                }
//            }
//        }
//
       
        let panel = NSOpenPanel();
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = true
        panel.resolvesAliases = false
        panel.canChooseFiles = false
        
        panel.beginSheetModal(for: NSApplication.shared.windows.first!) { (res) in
            if res == NSApplication.ModalResponse.OK {
                let doc = panel.url?.path
                let hh = doc! + "/" + self.rootName + "Request.h"
                let cpp = doc! + "/" + self.rootName + "Request.cpp"
                do {
                    try self._classHString.write(toFile: hh, atomically: false, encoding: String.Encoding.utf8)
                    try self._classCPPString.write(toFile: cpp, atomically: false, encoding: String.Encoding.utf8)

                }catch let erro {
                    print(erro)
                }
            }
        }
    }
    
    func makefile(json:Any?) -> (String, String) {
        let date = Date().description
        let end = date.index(date.startIndex, offsetBy: 10)
        let time = String(date[date.startIndex..<end])
        _classHString =  """
        //
        //  \(rootName)Request.h
        //  migang
        //
        //  Created by \(NSUserName()) on \(time).
        //
        //
        
        #ifndef __migang__\(rootName)Request__
        #define __migang__\(rootName)Request__
        
        #include "MGRequest.h"\n
        
        class \(rootName)Request : public MGRequest
        {
        public:
        \t\(rootName)Request();
        \tvirtual ~\(rootName)Request();
        
        \tCCDictionary* getKeymaps();
        
        \tCC_SYNTHESIZE_RETAIN(CCString*, type, type);
        };
        
        """
        
        _classCPPString = """
        //
        //  \(rootName)Request.cpp
        //  migang
        //
        //  Created by  \(NSUserName())  on \(time).
        //
        //
        
        #include "\(rootName)Request.h"\n
        
        \(rootName)Request::\(rootName)Request()
        :type(NULL)
        {
        \tthis->setmigangtype(CCStringMake("xx"));
        }
        
        \(rootName)Request::~\(rootName)Request()
        {
        \tCC_SAFE_RELEASE(type);

        }
        
        """
        handleDataEngine(object: json, key: rootName + "Response")
        
        
        _classHString += "#endif /* defined(__migang__\(rootName)Request__) */"
        
        return (_classHString, _classCPPString)
    }
    
    func handleDataEngine(object:Any, key:String) -> String {
        var propertyList = ""
        var initMembers = ""
        var denitMembers = ""
        
        if let dic = object as? Dictionary<String, Any> {
            
            for (proterty,value) in dic {
                propertyList += makePropertyName(proterty, type: value)
                initMembers += initMemberAndDenitMember(proterty, type: value).0
                denitMembers += initMemberAndDenitMember(proterty, type: value).1
                
                handleDataEngine(object: value, key: proterty)
            }
            
            _classHString += buildClass(classname: key.capitalized, property: propertyList)
            initMembers.removeLast(2)
            _classCPPString += buildCPP(classname: key.capitalized, initMembers: initMembers, denitMembers: denitMembers)

        }else if let array = object as? Array<Any> {
            let element = array.first
            handleDataEngine(object: element, key: key)
        }else{

        }
        
        return propertyList
    }

    func buildClass(classname:String, property:String) -> String {
        var str = ""
        str = """
        class \(classname) : public MGResponse
        {
        public:
        \t\(classname)();
        \tvirtual ~\(classname)();
        \(property)
        };\n
        
        """
        return str
    }
    
    func makePropertyName(_ name : String, type : Any) -> String {
        var ss = ""
        if type is Dictionary<String, Any> {
            //name = "CC_SYNTHESIZE_RETAIN(CCString*, time, time);"
        }else if type is Array<Any> {
            ss = "CC_SYNTHESIZE_RETAIN(CCArray*, \(name), \(name));"
        }else if type is Int {
            ss = "CC_SYNTHESIZE(int, \(name), \(name));"
        }else if type is String {
            ss = "CC_SYNTHESIZE_RETAIN(CCString*, \(name), \(name));"
        }else{
            
        }
        return "\t\(ss)\n"
    }
    
    func buildCPP(classname:String, initMembers:String, denitMembers:String) -> String {
        
        var ss = """
        
        \(classname)::\(classname)()
        :\(initMembers)
        {

        }
        
        \(classname)::~\(classname)()
        {
        \(denitMembers)
        }
        """
        return "\t\(ss)\n"
    }
    
    func initMemberAndDenitMember(_ name : String, type : Any ) -> (String, String) {
        var initm = ""
        var denitm = ""
   
        if type is Array<Any> || type is String {
            initm = "\(name)(NULL),\n"
            denitm = "\tCC_SAFE_RELEASE(\(name));\n"
        }
        return (initm, denitm)
    }
    
    func showAlertView(withtext : String ){
        let alert = NSAlert()
        alert.messageText = withtext
        alert.addButton(withTitle: "确定")
        alert.beginSheetModal(for: NSApplication.shared.windows.first!) { (modalResponse) in
            
        }
    }
    
    
}

