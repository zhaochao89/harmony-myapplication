import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { test } from '../pages/test';
//导入绑定* as Test表示绑定名称“Test”，通过Test.test()可访问从导入路径指定的模块导出的所有实体：
import * as Test from '../pages/test';

@Component
export default struct TestRoutePage {
  @State message: string = 'Hello World';
//组件的生命周期
  //组件即将出现时，在执行build()函数之前
  aboutToAppear(): void {
    console.info('+++++aboutToAppear');
  }
  //组件build()函数执行完成之后
  onDidBuild(): void {
    console.info('+++++onDidBuild');
  }
  //组件析构销毁之前执行
  aboutToDisappear(): void {
    console.info('+++++aboutToDisappear');
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Gray)
        Divider()
          .backgroundColor(Color.Red)
          .margin({
            top: 10,
            left: 16,
            right: 16
          })
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

        Divider()
          .backgroundColor('#dddddd')
          .margin({
            top: 8,
            left: 16,
            right: 16
          })
        Button() {
          Text('测试')
            .fontSize(20)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
        }
        .backgroundColor(Color.Red)
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .width(200)
        .height(44)
        .onClick(() => {
          test();
          Test.test();
        })
        HelloComponent()
          .margin({
            top: 20
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct HelloComponent {
  @State message: string = 'Hello World';

  build() {
    Text(this.message)
      .fontSize(35)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Pink)
  }
}