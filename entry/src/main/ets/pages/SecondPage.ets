import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct SecondPage {
  @State message: string = 'Hello World';

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