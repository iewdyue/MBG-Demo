<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.5/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.5/js/bootstrap-dialog.min.js"></script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP List RmOrder Records</title>
    <style type="text/css">
        .format-dialog .modal-dialog {
            width: 1000px;
        }
        table {
            word-break:break-all;
            word-wrap:break-all;
        }
        table td {
            width: 180px;
            /*overflow: hidden;*/
            /*display: inline-block;*/
            /*white-space: nowrap;*/
        }
        table th {
            width: 180px;
        }
    </style>　
</head>
<body>
<script>

    function showJson(data){
        BootstrapDialog.show({
            title: 'RM订单json信息',
            message: data,
            cssClass: 'format-dialog'
        });
//        getData(data);
    }
    function alertMsg(data){
        BootstrapDialog.show({
            title: 'RM订单相关信息',
            message: getformatdata(data),
            cssClass: 'format-dialog'
        });
//        getData(data);
    }
    function getformatdata(json){
        formatData12 = {
            "order_id": {
                "desc": "订单的ID，TD平台订单的唯一标识",
                "name": "TD平台订单id"
            },
            "order_name": {
                "desc": "订单的名称",
                "name": "订单名称"
            },
            "dsp_advertiser_id": {
                "desc": "订单在DSP系统中所属广告主的ID，创建时页面手动录入",
                "name": "广告主id"
            },
            "status": {
                "0": "暂停",
                "1": "投放中",
                "desc": "订单状态,0表示暂停，1表示投放中",
                "name": "订单状态"
            },
            "device": {
                "1": "PC",
                "2": "Mobile",
                "desc": "订单投放平台设备类型,1是PC，2是Mobile",
                "name": "投放平台类型"
            },
            "start_date": {
                "desc": "投放开始日期，只关注日期即可",
                "name": "投放开始日期"
            },
            "end_date": {
                "desc": "投放结束日期，只关注日期即可",
                "name": "投放结束日期"
            },
            "budget_total": {
                "desc": "总预算(单位：分)至少支持14位数字",
                "name": "总预算(单位：分)"
            },
            "budget_day": {
                "desc": "每日预算(单位：分) 至少支持14位数字",
                "name": "每日预算(单位：分) "
            },
            "is_test": {
                "0": "不是",
                "1": "是",
                "desc": "是否是功能测试订单,0表示不是，1表示是",
                "name": "是否是功能测试订单"
            },
            "monitor_group": {
                "desc": "监测分组信息",
                "name": "监测分组信息",
                "children": {
                    "monitor_group_id": {
                        "desc": "监测分组的id",
                        "name": "监测组id"
                    },
                    "monitor_group_name": {
                        "desc": "监测分组名称",
                        "name": "监测组名称"
                    },
                    "landing_page": {
                        "desc": "监测分组的着陆页，适用该监测组下所有创意",
                        "name": "监测组着陆页"
                    },
                    "impression_code": {
                        "desc": "展示监测代码，适用于分组下的所有创意",
                        "name": "展示监测代码"
                    },
                    "click_code": {
                        "desc": "点击监测代码，适用于分组下的所有创意",
                        "name": "点击监测代码"
                    },
                    "creative_group": {
                        "desc": "创意分组信息",
                        "name": "创意组",
                        "children": {
                            "creative_group_id": {
                                "desc": "创意分组的id",
                                "name": "创意组id"
                            },
                            "creative_group_name": {
                                "desc": "创意分组名称",
                                "name": "创意组名称"
                            },
                            "creative": {
                                "desc": "创意信息",
                                "name": "创意",
                                "children": {
                                    "id": {
                                        "desc": "创意id",
                                        "name": "创意id"
                                    },
                                    "name": {
                                        "desc": "创意名称",
                                        "name": "创意名称"
                                    },
                                    "width": {
                                        "desc": "创意的宽（尺寸）",
                                        "name": "创意宽"
                                    },
                                    "height": {
                                        "desc": "创意的高（尺寸）",
                                        "name": "创意高"
                                    },
                                    "type": {
                                        "desc": "创意类型（jpg、gif、swf等）",
                                        "name": "创意类型"
                                    },
                                    "download": {
                                        "0": "不需要下载",
                                        "1": "需要下载",
                                        "desc": "创意文件是否需要下载的标志,1表示需要下载，0表示不需要下载",
                                        "name": "文件是否需要下载"
                                    },
                                    "url": {
                                        "desc": "创意下载URL",
                                        "name": "创意下载Url"
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "strategy": {
                "desc": "策略字段",
                "name": "策略",
                "children": {
                    "strategy_id": {
                        "desc": "策略的ID，TD策略的唯一标识",
                        "name": "TD策略id"
                    },
                    "strategy_name": {
                        "desc": "策略的名称",
                        "name": "策略名称"
                    },
                    "type": {
                        "1": "横幅",
                        "2": "视频贴片",
                        "3": "开机屏",
                        "4": "信息流",
                        "desc": "策略类型,1横幅，2是视频贴片，3是开机屏，4是信息流",
                        "name": "策略类型"
                    },
                    "start_date": {
                        "desc": "投放开始日期",
                        "name": "投放开始日期"
                    },
                    "end_date": {
                        "desc": "投放结束日期",
                        "name": "投放结束日期"
                    },
                    "budget_total": {
                        "desc": "总预算(单位：分) 至少支持14位数字",
                        "name": "总预算(单位：分) "
                    },
                    "budget_day": {
                        "desc": "每日预算(单位：分) 至少支持14位数字",
                        "name": "每日预算(单位：分) "
                    },
                    "cost_type": {
                        "1": "CPC",
                        "2": "CPM",
                        "3": "CPA",
                        "4": "CPV",
                        "desc": "策略的计费方式，1-CPC，2-CPM，3-CPA，4-CPV",
                        "name": "策略计费方式"
                    },
                    "cost_single": {
                        "desc": "策略的计费标准(单位：分)，以CPC为例，表示单个CPC的价格",
                        "name": "策略的计费标准(单位：分)"
                    },
                    "other_restrictions": {
                        "desc": "TD平台对于策略的其他投放要求，如人群的定向信息",
                        "name": "策略其它要求"
                    },
                    "strategy_area": {
                        "desc": "策略投放的地域限制，不存在表示不设置",
                        "name": "策略投放地域"
                    },
                    "put_time": {
                        "desc": "策略投放的时间，策略在一周中可投放的时间，存储为1~24的时段，不存在表示不设置",
                        "name": "策略投放时间"
                    }
                }
            }
        };
        prefix = "";
        var strHTML = "";
        strHTML += "<table border=\"2\" cellpadding=\"5\" style='border-collapse:collapse;table-layout: fixed'>";
        strHTML += "<tr><th>属性名</th><th>属性值</th><th>描述</th></tr>";
        strHTML += getformatedata(json, formatData12, prefix);
        strHTML += "</table>";
        return strHTML;
//        return getformatedata(json, formatData12, prefix);
    }

    function getformatedata(json, formatData, prefix){
        var result = '';
        for(key in json){
            if(key == "tdTypeToYoyiTypeMap"){
                continue;
            }
            var value = json[key];
            var formatValue = formatData[key];
            if((typeof (value) != 'object' )
                    || !formatValue.hasOwnProperty("children")){
                result += "<tr>";
                result += "<td>"+prefix + formatValue["name"]+"</td>";
                if(formatValue.hasOwnProperty(value + "")){
                    result += "<td>"+ formatValue[value + ""]+"</td>";
                }else if (typeof(value) == 'object'){
                    if(key == "strategy_area"){
                        result += "<td>" + getAreaValue(value)+"</td>";
                    }else {
                        result += "<td>" + JSON.stringify(value)+"</td>";
                    }
                } else{
                    result += "<td>" + value+"</td>";
                }
                result += "<td>"+ formatValue["desc"]+"</td>";
                result += "</tr>";
            }else if(value instanceof  Array) {
                for(item in value){
                    result += getformatedata(value[item], formatValue["children"], prefix +formatValue["name"]+ "_" + (parseInt(item)+1)  + "_");
                }
            }else if(typeof (value) == 'object'){
                result += getformatedata(value, formatValue["children"], prefix +formatValue["name"]+ "_" );
            }
        }
        return result;
    }

    function getAreaValue(areaArray){
        var result = [];

        for(var index in areaArray){
            result.push(getAreaObject(areaArray[index]));
        }
        return JSON.stringify(result);
    }

    var allAreaJson = {
        "1": "安徽",
        "2": "安庆",
        "3": "蚌埠",
        "4": "毫州",
        "5": "巢湖",
        "6": "滁州",
        "7": "池州",
        "8": "阜阳",
        "9": "淮北",
        "10": "合肥",
        "11": "淮南",
        "12": "黄山",
        "13": "六安",
        "14": "马鞍山",
        "15": "宿州",
        "16": "铜陵",
        "17": "芜湖",
        "18": "安徽-未识别地区",
        "19": "宣城",
        "20": "澳门",
        "21": "北京",
        "22": "重庆",
        "23": "福建",
        "24": "莆田",
        "25": "福州",
        "26": "龙岩",
        "27": "宁德",
        "28": "南平",
        "29": "泉州",
        "30": "厦门",
        "31": "三明",
        "32": "福建-未识别地区",
        "33": "漳州",
        "34": "广东",
        "35": "潮州",
        "36": "东莞",
        "37": "佛山",
        "38": "广州",
        "39": "河源",
        "40": "惠州",
        "41": "江门",
        "42": "揭阳",
        "43": "茂名",
        "44": "梅州",
        "45": "清远",
        "46": "韶关",
        "47": "汕头",
        "48": "汕尾",
        "49": "深圳",
        "50": "广东-未识别地区",
        "51": "云浮",
        "52": "阳江",
        "53": "珠海",
        "54": "湛江",
        "55": "肇庆",
        "56": "中山",
        "57": "甘肃",
        "58": "白银",
        "59": "定西",
        "60": "甘南",
        "61": "金昌",
        "62": "酒泉",
        "63": "嘉峪关",
        "64": "陇南",
        "65": "临夏",
        "66": "兰州",
        "67": "平凉",
        "68": "庆阳",
        "69": "天水",
        "70": "甘肃-未识别地区",
        "71": "武威",
        "72": "张掖",
        "73": "广西",
        "74": "北海",
        "75": "百色",
        "76": "崇左",
        "77": "防城港",
        "78": "贵港",
        "79": "桂林",
        "80": "河池",
        "81": "贺州",
        "82": "来宾",
        "83": "柳州",
        "84": "南宁",
        "85": "钦州",
        "86": "广西-未识别地区",
        "87": "梧州",
        "88": "玉林",
        "89": "贵州",
        "90": "安顺",
        "91": "毕节",
        "92": "贵阳",
        "93": "六盘水",
        "94": "黔东南",
        "95": "黔南",
        "96": "黔西南",
        "97": "铜仁",
        "98": "贵州-未识别地区",
        "99": "遵义",
        "100": "河北",
        "101": "保定",
        "102": "承德",
        "103": "沧州",
        "104": "邯郸",
        "105": "衡水",
        "106": "廊坊",
        "107": "秦皇岛",
        "108": "石家庄",
        "109": "唐山",
        "110": "河北-未识别地区",
        "111": "邢台",
        "112": "张家口",
        "113": "湖北",
        "114": "恩施",
        "115": "鄂州",
        "116": "黄冈",
        "117": "黄石",
        "118": "荆门",
        "119": "潜江",
        "120": "神农架",
        "121": "十堰",
        "122": "随州",
        "123": "天门",
        "124": "武汉",
        "125": "湖北-未识别地区",
        "126": "襄阳",
        "127": "孝感",
        "128": "咸宁",
        "129": "仙桃",
        "130": "宜昌",
        "131": "黑龙江",
        "132": "大庆",
        "133": "大兴安岭",
        "134": "哈尔滨",
        "135": "鹤岗",
        "136": "黑河",
        "137": "佳木斯",
        "138": "鸡西",
        "139": "牡丹江",
        "140": "齐齐哈尔",
        "141": "七台河",
        "142": "绥化",
        "143": "双鸭山",
        "144": "黑龙江-未识别地区",
        "145": "伊春",
        "146": "河南",
        "147": "安阳",
        "148": "鹤壁",
        "149": "济源",
        "150": "焦作",
        "151": "开封",
        "152": "洛阳",
        "153": "南阳",
        "154": "平顶山",
        "155": "濮阳",
        "156": "三门峡",
        "157": "商丘",
        "158": "漯河",
        "159": "河南-未识别地区",
        "160": "许昌",
        "161": "新乡",
        "162": "信阳",
        "163": "周口",
        "164": "驻马店",
        "165": "郑州",
        "166": "湖南",
        "167": "常德",
        "168": "长沙",
        "169": "郴州",
        "170": "怀化",
        "171": "衡阳",
        "172": "娄底",
        "173": "邵阳",
        "174": "湖南-未识别地区",
        "175": "湘潭",
        "176": "湘西",
        "177": "岳阳",
        "178": "益阳",
        "179": "永州",
        "180": "张家界",
        "181": "株洲",
        "182": "海南",
        "183": "白沙黎族自治县",
        "184": "保亭黎族苗族自治县",
        "185": "昌江黎族自治县",
        "186": "澄迈县",
        "187": "定安县",
        "188": "东方",
        "189": "儋州",
        "190": "海口",
        "191": "临高县",
        "192": "陵水黎族自治县",
        "193": "琼海",
        "194": "三亚",
        "195": "文昌",
        "196": "万宁",
        "197": "屯昌",
        "198": "海南-未识别地区",
        "199": "五指山",
        "200": "吉林",
        "201": "白城",
        "202": "白山",
        "203": "长春",
        "204": "吉林",
        "205": "辽源",
        "206": "四平",
        "207": "松原",
        "208": "通化",
        "209": "吉林-未识别地区",
        "210": "延边",
        "211": "江苏",
        "212": "常州",
        "213": "淮安",
        "214": "连云港",
        "215": "南京",
        "216": "南通",
        "217": "宿迁",
        "218": "苏州",
        "219": "泰州",
        "220": "江苏-未识别地区",
        "221": "无锡",
        "222": "徐州",
        "223": "盐城",
        "224": "扬州",
        "225": "镇江",
        "226": "江西",
        "227": "抚州",
        "228": "赣州",
        "229": "吉安",
        "230": "景德镇",
        "231": "九江",
        "232": "南昌",
        "233": "萍乡",
        "234": "上饶",
        "235": "江西-未识别地区",
        "236": "新余",
        "237": "宜春",
        "238": "鹰潭",
        "239": "辽宁",
        "240": "鞍山",
        "241": "本溪",
        "242": "沈阳",
        "243": "丹东",
        "244": "大连",
        "245": "抚顺",
        "246": "阜新",
        "247": "葫芦岛",
        "248": "锦州",
        "249": "辽阳",
        "250": "盘锦",
        "251": "铁岭",
        "252": "辽宁-未识别地区",
        "253": "营口",
        "254": "朝阳",
        "255": "内蒙古",
        "256": "阿拉普",
        "257": "包头",
        "258": "巴彦淖尔",
        "259": "赤峰",
        "260": "鄂尔多斯",
        "261": "呼和浩特",
        "262": "呼伦贝尔",
        "263": "通辽",
        "264": "乌海",
        "265": "乌兰察布",
        "266": "内蒙古-未识别地区",
        "267": "心甘",
        "268": "锡林郭勒",
        "269": "宁夏",
        "270": "固原",
        "271": "石嘴山",
        "272": "宁夏-未识别地区",
        "273": "吴忠",
        "274": "银川",
        "275": "中卫",
        "276": "青海",
        "277": "海北",
        "278": "海东",
        "279": "海南",
        "280": "海西",
        "281": "青海-未识别地区",
        "282": "西宁",
        "283": "黄南",
        "284": "玉树",
        "285": "果洛",
        "286": "四川",
        "287": "阿坝",
        "288": "巴中",
        "289": "成都",
        "290": "德阳",
        "291": "达州",
        "292": "广安",
        "293": "广元",
        "294": "甘孜",
        "295": "凉山",
        "296": "乐山",
        "297": "泸州",
        "298": "眉山",
        "299": "绵阳",
        "300": "南充",
        "301": "内江",
        "302": "攀枝花",
        "303": "遂宁",
        "304": "四川-未识别地区",
        "305": "雅安",
        "306": "宜宾",
        "307": "自贡",
        "308": "资阳",
        "309": "山东",
        "310": "滨州",
        "311": "东营",
        "312": "德州",
        "313": "菏泽",
        "314": "济南",
        "315": "济宁",
        "316": "聊城",
        "317": "莱芜",
        "318": "临沂",
        "319": "青岛",
        "320": "日照",
        "321": "泰安",
        "322": "潍坊",
        "323": "咸海",
        "324": "山东-未识别地区",
        "325": "烟台",
        "326": "淄博",
        "327": "枣庄",
        "328": "上海",
        "329": "山西",
        "330": "长治",
        "331": "大同",
        "332": "晋城",
        "333": "晋中",
        "334": "临汾",
        "335": "吕梁",
        "336": "朔州",
        "337": "太原",
        "338": "山西-未识别地区",
        "339": "忻州",
        "340": "运城",
        "341": "阳泉",
        "342": "陕西",
        "343": "安康",
        "344": "宝鸡",
        "345": "汉中",
        "346": "商洛",
        "347": "铜川",
        "348": "渭南",
        "349": "陕西-未识别地区",
        "350": "西安",
        "351": "咸阳",
        "352": "延安",
        "353": "榆林",
        "354": "天津",
        "355": "台湾",
        "356": "高雄市",
        "357": "花莲县",
        "358": "嘉义市",
        "359": "南投县",
        "360": "屏东县",
        "361": "澎湖县",
        "362": "台北市",
        "363": "台东县",
        "364": "台南市",
        "365": "桃园县",
        "366": "台中市",
        "367": "台湾-未识别地区",
        "368": "新竹市",
        "369": "宜兰县",
        "370": "云林县",
        "371": "彰化县",
        "372": "西藏",
        "373": "昌都",
        "374": "拉萨",
        "375": "林芝",
        "376": "日喀则",
        "377": "山南",
        "378": "那曲",
        "379": "阿里",
        "380": "西藏-未识别地区",
        "381": "香港",
        "382": "新疆",
        "383": "阿克苏",
        "384": "阿拉尔",
        "385": "阿勒泰",
        "386": "博尔塔拉",
        "387": "巴音郭楞",
        "388": "昌吉",
        "389": "哈密",
        "390": "和田",
        "391": "克拉玛依",
        "392": "喀什",
        "393": "石河子",
        "394": "塔城",
        "395": "吐鲁番",
        "396": "乌鲁木齐",
        "397": "新疆-未识别地区",
        "398": "伊犁",
        "399": "克孜勒苏柯尔克孜",
        "400": "云南",
        "401": "保山",
        "402": "楚雄",
        "403": "德宏",
        "404": "大理",
        "405": "迪庆",
        "406": "红河",
        "407": "昆明",
        "408": "临沧",
        "409": "丽江",
        "410": "怒江傈",
        "411": "曲靖",
        "412": "普洱",
        "413": "文山",
        "414": "云南-未识别地区",
        "415": "西双版纳",
        "416": "玉溪",
        "417": "昭通",
        "418": "中国未识别地区",
        "419": "浙江",
        "420": "杭州",
        "421": "湖州",
        "422": "金华",
        "423": "嘉兴",
        "424": "丽水",
        "425": "宁波",
        "426": "衢州",
        "427": "绍兴",
        "428": "台州",
        "429": "浙江-未识别地区",
        "430": "温州",
        "431": "舟山",
        "432": "国内",
        "433": "国外",
        "434": "威海",
        "435": "亳州",
        "436": "阿拉善",
        "437": "荆州",
        "438": "云阳县",
        "439": "武隆县",
        "440": "巫溪县",
        "441": "巫山县",
        "442": "潼南县",
        "443": "铜梁县",
        "444": "綦江县",
        "445": "荣昌县",
        "446": "忠县",
        "447": "南川市",
        "448": "梁平县",
        "449": "开县",
        "450": "江津市",
        "451": "合川市",
        "452": "奉节县",
        "453": "丰都县",
        "454": "垫江县",
        "455": "大足县",
        "456": "城口县",
        "457": "璧山县",
        "458": "思茅市",
        "459": "兴安盟",
        "460": "北京",
        "461": "天津",
        "462": "上海",
        "463": "重庆",
        "464": "香港",
        "465": "澳门",
        "466": "台湾"
    };
    function getAreaObject(area){
        var result = {};
        for(var item in area){
            var value = area[item];
            if(typeof (value) == 'number'){
                var id = value + "";
                if(allAreaJson.hasOwnProperty(id)){
                    result[item] = allAreaJson[id];
                }else {
                    result[item] = value;
                }
                continue;
            }

            var list = [];
            for(var j in value){
                var id = value[j] + "";
                if(allAreaJson.hasOwnProperty(id)){
                    list.push(allAreaJson[id]);
                }else {
                    list.push(value);
                }
            }
            result[item] = list;
        }

        return result;

    }
</script>
<sql:setDataSource
        var="dsp3MainDb"
        driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://10.0.12.54:3316/dsp3_main?characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull"
user="yoyi_read" password="yoYi_data2017"
/>
<%--url="jdbc:mysql://192.168.5.135:3306/dsp3_main?characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull"--%>
<%--user="openapi" password="openapi"--%>

<sql:query var="listUsers" dataSource="${dsp3MainDb}">
    SELECT customer.id, customer.`companyName`, campaign.`name`, `yoyicampaign_rmorder`.`campaignId`,
    `yoyicampaign_rmorder`.`rmOrderId`,`yoyicampaign_rmorder`.`orderInfoJson`
    FROM `yoyicampaign_rmorder` LEFT JOIN `campaign` ON `yoyicampaign_rmorder`.`campaignId` = `campaign`.id
    LEFT JOIN `customer` ON `campaign`.`customerId` = `customer`.`id`
    order by `yoyicampaign_rmorder`.id desc;
</sql:query>

<div align="center">
    <table border="1" cellpadding="5" style='border-collapse:collapse;table-layout: fixed'>
        <caption><h2>RM订单信息列表</h2></caption>
        <tr>
            <th>广告主id</th>
            <th>广告主名称</th>
            <th>计划id</th>
            <th>计划名称</th>
            <th>RM订单Id</th>
            <th>可读信息</th>
            <th>json信息</th>
        </tr>
        <c:forEach var="user" items="${listUsers.rows}">
            <tr>
                <td><c:out value="${user.id}" /></td>
                <td><c:out value="${user.companyName}" /></td>
                <td><c:out value="${user.campaignId}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.rmOrderId}" /></td>
                <td>
                    <input type="button" name="btn1" id="showDialog" value="查看具体信息"
                           onclick="alertMsg(<c:out value="${user.orderInfoJson}" />)"
                />
                </td><td>
                <input type="button" name="btn2" id="btn2" value="json信息"
                       onclick="showJson('<c:out value="${user.orderInfoJson}" />')"
                />
            </td>


            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
