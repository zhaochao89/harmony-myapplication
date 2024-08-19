
@Component
export struct PageThreeTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column({ space: 30 }) {
        Text('这是第三个页面')
        Button('移除第一个页面')
          .onClick(() => {
            this.pageInfos.removeByName('NavDestinationTitle1');
          })
      }
      .width('100%')
      .height('100%')
    }
    .title('页面三')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop('这是返回携带的参数'); //弹出路由栈栈顶元素
      console.info('pop返回值' + JSON.stringify(popDestinationInfo));
      //返回根首页
      // this.pageInfos.clear();
      return true;
    })
  }
}