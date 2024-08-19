import { PageOneTmp } from './PageOneTmp';
import { PageThreeTmp } from './PageThreeTmp';
import { PageTwoTmp } from './PageTwoTmp';
import { BusinessError } from '@kit.BasicServicesKit';
import { DialogPage } from './DialogPage';
/*
 * 动态路由跳转时，目标页面要用NavDestination包裹，并且目标页面要配置router_map.json。
 * 需要跳转的页面要在oh-package.json5中配置依赖模块，页面中要import引入目标页面。引入格式为：
 * {module}/src/main/ets/components/MainPage，module要和和oh-package.json5中dependencies配置的保持一致。
 * */
import('sharedLibrary/src/main/ets/components/MainPage');

@Entry
@Component
struct NavigationExamplePage {
  @State TooTmp: ToolbarItem = {value: 'func', icon: $r('app.media.ico_user_selected'), action:
  () => {}};
  @Provide('z') pageInfos: NavPathStack = new NavPathStack();
  private arr: string[] = ['跳转页面一', '跳转页面二', '跳转页面三', 'Dialog页面', '动态路由跳转不同模块页面'];

  @Builder
  PageMap(name: string) {
    if (name === 'NavDestinationTitle1') {
      PageOneTmp()
    } else if (name === 'NavDestinationTitle2') {
      PageTwoTmp()
    } else if (name === 'NavDestinationTitle3') {
      PageThreeTmp()
    } else if (name === 'NextPage') {
      PageThreeTmp()
    } else if (name === 'NavDestinationTitle4') {
      DialogPage()
    }
  }

  aboutToAppear(): void {
    //关闭转场动画，这里是全局关闭
    this.pageInfos.disableAnimation(false);
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        TextInput({ placeholder: '请输入...'})
          .width('90%')
          .height(40)
          .backgroundColor(Color.White)

        List({ space: 12 }) {
          ForEach(this.arr, (item: string, index: number) => {
            ListItem() {
              Text(this.arr[index])
                .width('100%')
                .height(72)
                .backgroundColor(Color.White)
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  if (index === 4) {
                    this.pageInfos.pushDestinationByName('MainPage', null)
                      .then(() => {
                        console.info('+++++跳转成功');
                      })
                      .catch((err: BusinessError) => {
                        console.error(`+++++跳转失败：${err.code}  ${err.message}`);
                      })
                  } else {

                    //路由跳转拦截
                    this.pageInfos.setInterception({
                      willShow: (from: NavDestinationContext | 'navBar', to: NavDestinationContext
                        | 'navBar', operation: NavigationOperation, animated: boolean) => {
                        if (typeof to === 'string') {
                          console.log('target page is navigation home page')
                          return;
                        }
                        //将跳转到PageTwo的路由重定向到PageOne
                        let target: NavDestinationContext = to as NavDestinationContext;
                        if (target.pathInfo.name === 'NavDestinationTitle2') {
                          target.pathStack.pop();
                          target.pathStack.pushPathByName('NavDestinationTitle1', null);
                        }
                      }
                    });
                    // this.pageInfos.pushPath({ name: 'NavDestinationTitle' + item, param: "这是参数" })
                    // this.pageInfos.pushPathByName('NavDestinationTitle' + item, '这是参数', (popInfo) => {
                    //   console.log('Pop page name is: ' + popInfo.info.name + ', result: ' + JSON.stringify(popInfo.result))
                    // });
                    this.pageInfos.pushDestinationByName('NavDestinationTitle' + `${index + 1}`,
                      '这是跳转传递的参数',
                      (popInfo) => {
                        console.log('Pop page name is: ' + popInfo.info.name + ', result: ' + JSON.stringify(popInfo.result))
                      })
                      .then(() => {
                        console.info('跳转成功');
                      })
                      .catch((err: BusinessError) => {
                        console.error(`跳转失败：${err.code} ${err.message}`);
                      })
                  }
                })
            }
          }, (item: string) => item)
        }
        .width('90%')
        .margin({
          top: 12
        })
      }
      .title('主标题')
      .mode(NavigationMode.Stack) //设置页面显示模式
      .titleMode(NavigationTitleMode.Mini) //设置标题栏模式
      .navDestination(this.PageMap)
      .menus([
        {value: "item1", icon: "resources/base/media/ico_home_selected.png", action: ()=> {}},
        //引入resources中的资源
        {value: "item2", icon: "resources/base/media/ico_trial_selected.png", action: ()=> {}},
        {value: "item3", icon: "resources/base/media/ico_user_selected.png", action: ()=> {}},
        {value: "item4", icon: "resources/base/media/ico_ai_selected.png", action: ()=> {}},
        {value: "item5", icon: "./image/ic_public_add.svg", action: ()=> {}}
      ])
      .toolbarConfiguration([this.TooTmp, this.TooTmp, this.TooTmp])
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}