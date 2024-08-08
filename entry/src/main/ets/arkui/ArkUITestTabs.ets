
@Component
export struct ArkUITestTabs {

  @State
  currentIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder
  tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#2BA471' : Color.Black)
        .margin({ top: 4 })
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    this.customTabs()
  }

  @Builder
  customTabs() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Text('首页的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('首页', 0, $r('app.media.ico_home_selected'), $r('app.media.ico_home_normal')))

        TabContent() {
          Text('天平的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('天平', 1, $r('app.media.ico_trial_selected'), $r('app.media.ico_trial_normal')))

        TabContent() {
          Text('机器人的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('机器人', 2, $r('app.media.ico_ai_selected'), $r('app.media.ico_ai_normal')))

        TabContent() {
          Text('我的内容').fontSize(30)
        }
        .tabBar(this.tabBuilder('我的', 3, $r('app.media.ico_user_selected'), $r('app.media.ico_user_normal')))
      }
      .scrollable(false)
      .onChange((index) => {
        this.currentIndex = index;
      })
      //自定义拦截事件
      .onContentWillChange((currentIndex, comingIndex) => {
        if (comingIndex == 2) {
          return false;
        }
        return true;
      })
      .height(500)

      Button('动态修改index').width('50%').margin({ top: 30 })
        .onClick(() => {
          this.currentIndex = (this.currentIndex + 1) % 4;
        })
      Button('changeIndex').width('50%').margin({ top: 30 })
        .onClick(() => {
          let index = (this.currentIndex + 1) % 4;
          this.controller.changeIndex(index);
        })
    }
  }

  @Builder
  systemTabs() {
    //barPosition设置为底部导航，默认为顶部导航
    Tabs({ barPosition: BarPosition.End }) {
      TabContent(){
        Text('首页的内容').fontSize(30)
      }
      .tabBar('首页')

      TabContent(){
        Text('推荐的内容').fontSize(30)
      }
      .tabBar('推荐')

      TabContent(){
        Text('发现的内容').fontSize(30)
      }
      .tabBar('发现')

      TabContent(){
        Text('我的内容').fontSize(30)
      }
      .tabBar('我的')
    }
    //设置是否为侧边导航
    .vertical(false)
    .barHeight(49)
    //禁止滑动切换
    .scrollable(false)
    //控制导航栏是否可以滚动, 默认是Fixed不可滚动
    .barMode(BarMode.Fixed)
  }
}