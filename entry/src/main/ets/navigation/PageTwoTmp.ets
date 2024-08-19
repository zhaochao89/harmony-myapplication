
@Component
export struct PageTwoTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text('这是第二个页面')
      }
      .width('100%')
      .height('100%')
    }
    .title('页面二')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); //弹出路由栈栈顶元素
      console.info('pop返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}