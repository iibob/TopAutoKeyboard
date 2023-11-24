# -*- coding: utf-8 -*-

# 此代码显示了从英文到简体中文的文本翻译示例。
# 这段代码在Python 2.7.x和Python 3.x上运行。
# 您可以安装“requests”来运行此代码：pip-install-requests
# 请参阅`https://api.fanyi.baidu.com/doc/21`获取完整的api文档

import requests
import random
import json
import os
from hashlib import md5
import pyperclip
from PIL import ImageGrab
from time import sleep


# query = 'Hello World! This is 1st paragraph.\nThis is 2nd paragraph.'
img_name = "ocr_translate_image.png"

# 获取百度翻译的 id key
with open('config.txt', 'r') as file:
    content = file.readlines()
appid = content[0].rstrip()
appkey = content[1].rstrip()


def baidu_translate(query):
    # query：待翻译的字符串，可使用 \n 换行

    # 有关语言代码的列表，请参阅 `https://api.fanyi.baidu.com/doc/21`
    # from_lang = 'en'
    from_lang = 'auto'
    to_lang = 'zh'

    endpoint = 'http://api.fanyi.baidu.com'
    path = '/api/trans/vip/translate'
    url = endpoint + path

    # 生成盐并签名
    def make_md5(s, encoding='utf-8'):
        return md5(s.encode(encoding)).hexdigest()

    salt = random.randint(32768, 65536)
    sign = make_md5(appid + query + str(salt) + appkey)

    # 生成请求
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    payload = {'appid': appid, 'q': query, 'from': from_lang, 'to': to_lang, 'salt': salt, 'sign': sign}

    # 发送请求
    r = requests.post(url, params=payload, headers=headers)
    result = r.json()

    # 显示响应
    # print(json.dumps(result, indent=4, ensure_ascii=False))

    if "error_code" in result:
        error_code = "翻译出错代码: " + result["error_code"]
        return error_code
    else:
        items = ""
        # 获取所有的 dst 值
        for item in result["trans_result"]:
            items += item["dst"] + "\n"
        # 删除字符串末尾的最后一个换行符
        items = items[:-1]
        return items


def ocr_translate(img_name):
    # img_name：图片路径
    # 最短边至少30px，最长边最大4096px，长宽比3：1以内

    endpoint = 'http://api.fanyi.baidu.com'
    path = '/api/trans/sdk/picture'
    url = endpoint + path

    from_lang = 'auto'
    to_lang = 'zh'

    app_id = appid
    app_key = appkey

    # cuid & mac
    cuid = 'APICUID'
    mac = 'mac'

    # 生成盐并签名
    def get_md5(string, encoding='utf-8'):
        return md5(string.encode(encoding)).hexdigest()

    def get_file_md5():
        with open(img_name, 'rb') as f:
            data = f.read()
            return md5(data).hexdigest()

    salt = random.randint(32768, 65536)
    sign = get_md5(app_id + get_file_md5() + str(salt) + cuid + mac + app_key)

    # 生成请求
    payload = {'from': from_lang, 'to': to_lang, 'appid': app_id, 'salt': salt, 'sign': sign, 'cuid': cuid, 'mac': mac}
    image = {'image': (os.path.basename(img_name), open(img_name, 'rb'), "multipart/form-data")}

    # 发送请求
    response = requests.post(url, params=payload, files=image)
    result = response.json()

    # 显示响应
    # print(json.dumps(result, indent=4, ensure_ascii=False))

    if result["error_code"] == '0':
        all_src = ''
        all_dst = ''

        for item in result['data']['content']:
            all_src += item['src'] + '\n'
            all_dst += item['dst'] + '\n'

        # 删除最后一个换行符
        all_src = all_src[:-1]
        all_dst = all_dst[:-1]

        # 合并字符串使用 &+& 连接
        combined_string = all_src + "&+&" + all_dst
        return combined_string
    else:
        error_code = "翻译出错代码: " + result["error_code"]
        return error_code



try:
    # 判断剪贴板中是否是图片
    image = ImageGrab.grabclipboard()   # 抓取剪贴板中的图像
    width, height = image.size  # 获取图像的宽度和高度
    if width < 30 or height < 30:
        # print("宽度或高度小于30像素")
        pyperclip.copy("图片宽度或高度小于30像素")
    else:
        image.save(img_name)   # 保存图像到指定路径
        sleep(0.2)
        pyperclip.copy(ocr_translate(img_name)) # 将内翻译后的容复制到剪贴板
except:
    clipboard_data = pyperclip.paste()  # 从剪贴板获取数据
    if clipboard_data:
        # print("剪贴板无图 有字符串")
        # pyperclip.copy("剪贴板无图 有字符串")
        pyperclip.copy(baidu_translate(clipboard_data))
    else:
        # print('剪贴板为空')
        pyperclip.copy("剪贴板为空")
