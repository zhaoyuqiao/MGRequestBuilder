//
//  ViewController.swift
//  MGRequestBuilder
//
//  Created by zhao on 2018/3/15.
//  Copyright © 2018年 zhao. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    var _classString:String = ""
    
    @IBOutlet var jsonTextView: NSTextView!
    @IBOutlet var headTextView: NSTextView!    
    @IBOutlet var sourceTextView: NSTextView!
    @IBOutlet weak var rootClassName: NSTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let string = "{\"bannerarray\":[{\"title\":\"打发打发士大夫\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/149509918146725251.png\",\"sharetitle\":\"打发士发大水法\",\"sharedescription\":\"范德萨发大水法法的萨芬\",\"url\":\"https://m-develop.migang.com/active/cxo66?source2=app\"},{\"title\":\"金秋\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/150063764879144114.jpg\",\"sharetitle\":\"米缸金融与安心互联网保险达成履约保证保险合作分享标题\",\"sharedescription\":\"米缸金融与（以下简称“安心互联网保险”）达成履约保证保险合作分享内容\",\"url\":\"https://m-develop.migang.com/active/cxo73?source2=app\"},{\"title\":\"瑞狗迎新春米缸贺新年\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/151840060198468676.jpg\",\"sharetitle\":\"瑞狗迎新春米缸贺新年\",\"sharedescription\":\"瑞狗迎新春米缸贺新年，回味2017，迎接2018\",\"url\":\"https://m-dev00.migang.com/active/cxo77?source2=app\"}],\"restmoney\":\"910.50\",\"productshow\":0}"
        jsonTextView.textStorage?.setAttributedString(NSAttributedString(string: string))
        //let string = "{\"sectionarray\":[{\"rowarray\":[{\"proid\":\"9158\",\"type\":1,\"advert\":\"优质房产抵押\",\"kuailetype\":0,\"name\":\"三yueMi缸\",\"pronum\":\"A180313174935\",\"probability\":\"8.0\",\"probabilityunit\":\"%\",\"extrarate\":\"0.0\",\"deadline\":\"3个月\",\"deadlineunit\":\"\",\"buttontype\":1,\"buttontypedes\":\"预购\",\"process\":8.88,\"totalmoney\":\"0.82万\",\"totalmoneyunit\":\"\",\"imageurl\":\"\",\"surplustext\":\"距预购\",\"second\":0,\"huodongicon\":\"\"}],\"type\":3,\"havemore\":0,\"typedes\":\"推荐\",\"titleicon\":\"https://img-develop.migang.com/v2/app/images/index_product_icon/recommended_icon.png\"},{\"rowarray\":[{\"proid\":\"9001\",\"type\":3,\"advert\":\"优质房产抵押\",\"kuailetype\":0,\"name\":\"非预售\",\"pronum\":\"B171214095812\",\"probability\":\"8.0\",\"probabilityunit\":\"%\",\"extrarate\":\"0.0\",\"deadline\":\"6个月\",\"deadlineunit\":\"\",\"buttontype\":0,\"buttontypedes\":\"已满额\",\"process\":100,\"totalmoney\":\"1万\",\"totalmoneyunit\":\"\",\"imageurl\":\"\",\"surplustext\":\"距预购\",\"second\":0,\"huodongicon\":\"\"},{\"proid\":\"9000\",\"type\":1,\"advert\":\"优质房产抵押\",\"kuailetype\":0,\"name\":\"预售\",\"pronum\":\"D171214095755\",\"probability\":\"8.0\",\"probabilityunit\":\"%\",\"extrarate\":\"0.0\",\"deadline\":\"1个月\",\"deadlineunit\":\"\",\"buttontype\":0,\"buttontypedes\":\"已满额\",\"process\":100,\"totalmoney\":\"1万\",\"totalmoneyunit\":\"\",\"imageurl\":\"\",\"surplustext\":\"距预购\",\"second\":0,\"huodongicon\":\"\"},{\"proid\":\"5610\",\"type\":3,\"advert\":\"优质房产抵押\",\"kuailetype\":0,\"name\":\"自动活期5\",\"pronum\":\"HZD201711305\",\"probability\":\"8.0\",\"probabilityunit\":\"%\",\"extrarate\":\"0.0\",\"deadline\":\"1个月\",\"deadlineunit\":\"\",\"buttontype\":0,\"buttontypedes\":\"已满额\",\"process\":100,\"totalmoney\":\"10万\",\"totalmoneyunit\":\"\",\"imageurl\":\"\",\"surplustext\":\"距预购\",\"second\":0,\"huodongicon\":\"\"}],\"type\":3,\"havemore\":1,\"typedes\":\"优选列表\",\"titleicon\":\"https://img-develop.migang.com/v2/app/images/index_product_icon/regular_icon.png\"}],\"bannerarray\":[{\"title\":\"打发打发士大夫\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/149509918146725251.png\",\"sharetitle\":\"打发士发大水法\",\"sharedescription\":\"范德萨发大水法法的萨芬\",\"url\":\"https://m-develop.migang.com/active/cxo66?source2=app\"},{\"title\":\"微信推广cfca\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/149697515604774402.png\",\"sharetitle\":\"微信推广\",\"sharedescription\":\"微信推广示范\",\"url\":\"https://m-develop.migang.com/active/mgcfca?source2=app\"},{\"title\":\"金秋\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/150063764879144114.jpg\",\"sharetitle\":\"米缸金融与安心互联网保险达成履约保证保险合作分享标题\",\"sharedescription\":\"米缸金融与（以下简称“安心互联网保险”）达成履约保证保险合作分享内容\",\"url\":\"https://m-develop.migang.com/active/cxo73?source2=app\"},{\"title\":\"瑞狗迎新春米缸贺新年\",\"type\":1,\"proid\":\"0\",\"imgurl\":\"https://img-develop.migang.com/upload/banner/151840060198468676.jpg\",\"sharetitle\":\"瑞狗迎新春米缸贺新年\",\"sharedescription\":\"瑞狗迎新春米缸贺新年，回味2017，迎接2018\",\"url\":\"https://m-dev00.migang.com/active/cxo77?source2=app\"}],\"restmoney\":\"910.50\",\"productshow\":0,\"productarray\":[{\"type\":1,\"imageurl\":\"https://img-develop.migang.com/v2/app/images/index_product_icon/default_icon/product_icon_1.png\",\"introduceurl\":\"https://m-dev00.migang.com/help/new_user_recommended?source=app\",\"name\":\"米缸新手标\",\"tip\":\"新手专享\"},{\"type\":3,\"imageurl\":\"https://img-develop.migang.com/v2/app/images/index_product_icon/default_icon/product_icon_2.png\",\"introduceurl\":\"\",\"name\":\"米缸优选\",\"tip\":\"固定收益|6.8%-8%\"},{\"type\":4,\"imageurl\":\"https://img-develop.migang.com/v2/app/images/index_product_icon/default_icon/product_icon_6.png\",\"introduceurl\":\"\",\"name\":\"转让专区\",\"tip\":\"期限短，收益高\"}],\"tabarray\":[],\"announcementarray\":[{\"announcement\":\"米缸金融APP2.9.0\"},{\"announcement\":\"米缸金融APP2.9.0米缸金融APP2.9.0\"},{\"announcement\":\"app2.7.0公告123\"},{\"announcement\":\"app2.7.0公告\"},{\"announcement\":\"cesAPP\"}],\"pullarray\":[{\"time\":\"1521108024\",\"array\":[{\"name\":\"品牌实力\",\"description\":\"中国互联网金融协会首批会员\"},{\"name\":\"资金监管\",\"description\":\"开通银行资金存管\"},{\"name\":\"优质资产\",\"description\":\"优质房产抵押债权\"},{\"name\":\"安全保障\",\"description\":\"履约保证保险本息承保\"}]}]}"
        
        
        
//        print(file)

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func didMake(_ sender: NSButton) {
        var string = jsonTextView.textStorage?.string
        let jsondata = string?.data(using: String.Encoding.utf8)
        let data =  try? JSONSerialization.jsonObject(with: jsondata!, options: [])
        
        let file = makefile(json: data)
        
        headTextView.textStorage?.setAttributedString(NSAttributedString(string: file))
    }
    
    
    func makefile(json:Any?) -> String {
        
        _classString =  """
                    //
                    //  \(rootClassName.stringValue)Request.h
                    //  migang
                    //
                    //  Created on \(Date().description).
                    //
                    //

                    #ifndef __migang__\(rootClassName.stringValue)__
                    #define __migang__\(rootClassName.stringValue)__

                    #include "MGRequest.h"\n
                    """
        handleDataEngine(object: json, key: rootClassName.stringValue)
        
        
        _classString += "#endif /* defined(__migang__\(rootClassName.stringValue)__) */"
        return _classString
    }
    
    func handleDataEngine(object:Any, key:String) -> String {
        var propertyList = ""
        var isObj = false
        
        if let dic = object as? Dictionary<String, Any> {
            
            for (proterty,value) in dic {
                propertyList += makePropertyName(proterty, type: value)
                
                handleDataEngine(object: value, key: proterty)

            }
            
            _classString += writeClassBegin(classname: key.capitalized, property: propertyList)

        }else if let array = object as? Array<Any> {
            let element = array.first
            
            handleDataEngine(object: element, key: key)
            
        }else{
            isObj = false
        }
        
        if isObj {
        }
        return propertyList
    }
    
    func writeClassBegin(classname:String, property:String) -> String {
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
}

