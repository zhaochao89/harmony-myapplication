import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct SecondPage {
  @State message: string = 'Hello World';
//页面的生命周期
  //页面显示时
  onPageShow(): void {
    console.info('+++++onPageShow');
  }
  //页面隐藏时
  onPageHide(): void {
    console.info('+++++onPageHide');
  }
  //用户点击返回按钮时
  onBackPress(): boolean | void {
    console.info('+++++onBackPress');
    // 返回true表示页面自己处理返回逻辑，不进行页面路由；返回false表示使用默认的路由返回逻辑，不设置返回值按照false处理
    return true;
  }

  build() {
    Row() {
      Column() {
        Text('There is Second Page')
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
        Button() {
          Text('Back')
            .fontSize(20)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Medium)
        }
        .type(ButtonType.Capsule)
        .backgroundColor(Color.Blue)
        .margin({
          top: 20
        })
        .width(200)
        .height(44)
        .onClick(() => {
          console.info(`Click 'Next' button Successful.`)
          try {
            //返回上一页
            router.back()
          } catch (e) {
            let code = (e as BusinessError).code
            let message = (e as BusinessError).message
            console.error(`Back to first page Failed: code ${code}, message: ${message}.`)
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}