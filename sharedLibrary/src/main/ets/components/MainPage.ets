@Component
export struct MainPage {
  @State message: string = '这是sharedLibrary模块的页面';

  // @Consume('pageInfos') pageInfos: NavPathStack;
  //可以通过onReady获取页面堆栈对象，减少耦合
  pathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {

      Row() {
        Column() {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              console.info(`+++++页面的路由名称：${this.pathStack.getAllPathName().toString()}`)
            })
        }
        .width('100%')
      }
      .height('100%')
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}

@Builder
export function MainPageBuilder() {
  MainPage()
}