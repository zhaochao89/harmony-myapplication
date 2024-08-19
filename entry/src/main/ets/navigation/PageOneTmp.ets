import json from '@ohos.util.json';

@Component
export struct PageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column({ space: 30 }) {
        Text('这是第一个页面')
        Button('获取参数')
          .onClick(() => {
           let params: string[] = this.pageInfos.getParamByName('NavDestinationTitle1') as string[]
            console.info(`获取到的参数：${params[0]}`);
          })
        Button('下一页')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'NextPage' }, false);
          })
      }
      .width('100%')
      .height('100%')
    }
    .title('页面一')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); //弹出路由栈栈顶元素
      console.info('pop返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}