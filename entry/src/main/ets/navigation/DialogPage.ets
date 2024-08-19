import { uiObserver } from '@kit.ArkUI';

@Component
export struct DialogPage {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Center }) {
        Column() {
          Text('Dialog NavDestination')
            .fontSize(20)
            .margin({ bottom: 100 })
          MyComponent()
          Button('close')
            .onClick(() => {
              this.pageInfos.pop();
            })
            .width('30%')
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .height('30%')
        .width('80%')
      }
      .height('100%')
      .width('100%')
    }
    .backgroundColor('rgba(0,0,0,0.5)')
    .hideTitleBar(true)
    .mode(NavDestinationMode.DIALOG)
  }
}

@Component
struct MyComponent {
  navDesInfo: uiObserver.NavDestinationInfo | undefined;

  aboutToAppear(): void {
    this.navDesInfo = this.queryNavDestinationInfo();
  }

  build() {
    Column() {
      Text(`所属页面Name：${this.navDesInfo?.name}`)
    }
    .width('100%')
  }
}