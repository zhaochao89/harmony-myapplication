import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Next')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
        }
        .type(ButtonType.Capsule)
        .backgroundColor(Color.Blue)
        .margin({
          top: 20
        })
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.info(`Click 'Next' button Successful`)
          router.pushUrl({ url: 'pages/SecondPage' })
            .then(() => {
              console.info('Jump to second page Successful')
            })
            .catch((err: BusinessError) => {
              console.error(`Jump to second page Failed: code: ${err.code}, message: ${err.message}.`)
            })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}