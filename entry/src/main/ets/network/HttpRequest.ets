import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { Type, plainToClass } from 'class-transformer';
import 'reflect-metadata';

const TAG = '[HTTPRequest]';

@Component
export struct TestHttp {
  get() {
    //每一个httpRequest对应一个HTTP请求任务，不可复用
    let httpRequest = http.createHttp();
    //用于订阅HTTP响应头，此接口会比request请求先返回。
    httpRequest.on("headersReceive", (header) => {
      console.info(TAG + 'headers：' + JSON.stringify(header));
    })
    httpRequest.request(
      'https://jsonplaceholder.typicode.com/posts/1',
      {
        method: http.RequestMethod.GET, //可选，默认是GET请求
        header: {
          'Content-type': 'application/json'
        },
        expectDataType: http.HttpDataType.OBJECT, //可选，指定返回数据的类型
        connectTimeout: 60000, //可选，默认是60000ms
        readTimeout: 60000, //可选，默认是60000ms
      }, (err: BusinessError, data: http.HttpResponse) => {
      if (!err) {
        //data.result为HTTP响应的内容
        console.info(TAG + 'Result：' + JSON.stringify(data.result));
        console.info(TAG + 'code：' + JSON.stringify(data.responseCode));
        //json转对象
        const userInfo = plainToClass(UserInfo, data.result);
        console.info(TAG + 'userInfo：', userInfo);
        console.warn(TAG + userInfo.title);
        //data.header为HTTP响应头
        console.info(TAG + 'header：' + JSON.stringify(data.header));
        console.info(TAG + 'cookies' + JSON.stringify(data.cookies));
        //取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        //当前请求使用完毕后，调用destroy方法主动销毁
        httpRequest.destroy();
      } else {
        console.error(TAG + 'error：' + JSON.stringify(err));
        //取消订阅HTTP响应头事件
        httpRequest.off('headersReceive');
        //当前请求使用完毕后，调用destroy方法主动销毁
        httpRequest.destroy();
      }
    }
    )
  }

  post() {
    const httpRequest = http.createHttp();
    httpRequest.request(
      'https://jsonplaceholder.typicode.com/todos',
      {
        method: http.RequestMethod.POST,
        connectTimeout: 6000,
        readTimeout: 6000,
        expectDataType: http.HttpDataType.OBJECT,
        extraData: { //post请求参数
          "userId": 1,
          "id": 101,
          "title": "哈哈这是我Post的",
          "completed": false
        }
      },
      (err: BusinessError, data: http.HttpResponse) => {
        if (!err) {
          console.info(TAG + 'Result：' + JSON.stringify(data.result));
        } else {
          console.error(TAG + 'error：' + JSON.stringify(err));
        }
        httpRequest.destroy();
      }
    )
  }

  build() {
    Column({ space: 30 }) {
      Button('发送GET请求')
        .onClick(() => {
          this.get();
        })
      Button('发送POST请求')
        .onClick(() => {
          this.post();
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

class UserInfo {
  userId: number = 0;
  id: number = 0;
  title: string = '';
  body: string = '';
}