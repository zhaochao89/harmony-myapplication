@Component
export struct MainPage {
  @State message: string = '这是sharedLibrary模块的页面';

  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {

      Row() {
        Column() {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              console.info(`+++++页面的路由名称：${this.pageInfos.getAllPathName().toString()}`)
            })
        }
        .width('100%')
      }
      .height('100%')
    }
  }
}

@Builder
export function MainPageBuilder() {
  MainPage()
}