const alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
  'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

@Component
export struct ArtUITestList {
  //List滚动监听
  private listScroller: Scroller = new Scroller();
  @State selectedIndex: number = 1;

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      this.listItemGroup()
      // Button(){
      //   Text('🔼')
      // }
      // .onClick(() => {
      //   //点击按钮指定跳转位置，返回列表顶部
      //   this.listScroller.scrollToIndex(0)
      // })
      //字母表索引组件
      AlphabetIndexer({ arrayValue: alphabets, selected: 1 })
        .selected(this.selectedIndex)
        .onSelect((index: number) => {
          console.log(`+++++++点击了${index}`)
          this.listScroller.scrollToIndex(index);
        });
    }
  }

  @Builder
  item(text: string) {
    Row() {
      Image($r('app.media.startIcon')).width(40).height(40).borderRadius(20).margin(10)
      Text(text).fontSize(24)
    }
  }

  @Builder
  listItem() {
    //space设置列表项之间的间距
    List({ space: 10 }) {
      //ListItem只能有一个根节点组件，所有由多个组件元素组成时需要将这些元素组合到一个容器组件内或者自定义一个组件
      ListItem() {
        this.item('北京')
      }

      ListItem() {
        this.item('杭州')
      }

      ListItem() {
        this.item('上海')
      }

      ListItem() {
        Row() {
          Image($r('app.media.startIcon')).width(40).height(40).borderRadius(20).margin(10)
          Text('深圳').fontSize(24)
        }
      }

      ListItem() {
        Row() {
          Image($r('app.media.startIcon')).width(40).height(40).borderRadius(20).margin(10)
          Text('武汉').fontSize(24)
        }
      }

      ListItem() {
        Row() {
          Image($r('app.media.startIcon')).width(40).height(40).borderRadius(20).margin(10)
          Text('广州').fontSize(24)
        }
      }

      ListItem() {
        Row() {
          Image($r('app.media.startIcon')).width(40).height(40).borderRadius(20).margin(10)
          Text('重庆').fontSize(24)
        }
      }
    }
    .height(300)
    .backgroundColor('#FFF1F3F5')
    //设置子元素在交叉轴上显示几列，默认是1
    .lanes(1)
    //设置子元素在交叉轴上的对齐方式
    .alignListItem(ListItemAlign.Start)
    //设置分割线
    .divider({
      strokeWidth: 1,
      color: Color.Green,
      startMargin: 16,
      endMargin: 16
    })
    //设置滚动条显示
    .scrollBar(BarState.On)
  }

  @Builder
  header(text: string) {
    Text(text)
      .fontSize(20)
      .fontColor(Color.Black)
      .width('100%')
      .padding(5)
      .backgroundColor('#fff1f2f3')
  }

  @Builder
  endAction() {
    Text('删除').fontSize(24).fontColor(Color.Red);
  }
  @Builder
  startAction() {
    Text('标记').fontSize(24).fontColor(Color.Red);
  }

  @Builder
  listItemGroup() {
    List({ space: 20, scroller: this.listScroller }) {
      ListItemGroup({ header: this.header('A') }) {
        ListItem() {
          Text('安徽')
            .width('100%').fontSize(24).textAlign(TextAlign.Start)
        }
        .margin(10)
        //设置左滑和右滑的操作
        .swipeAction({
          start: {
            builder: () => this.startAction()
          },
          end: {
            builder: () => this.endAction(),
          }
        })

        ListItem() {
          //标记组件
          Badge({
            count: 2,
            position: BadgePosition.RightTop,
            style: {
              badgeSize: 16,
              badgeColor: Color.Red
          }
          }){
            Text('安庆').fontSize(24)
          }
        }
        .margin(10)

        ListItem() {
          Text('安阳').fontSize(24)
        }
        .margin(10)
      }

      ListItemGroup({ header: this.header('B') }) {
        ListItem() {
          Text('北京').fontSize(24)
        }
        .margin(10)
      }

      ListItemGroup({ header: this.header('C') }) {
        ListItem() {
          Text('长沙').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('重庆').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('成都').fontSize(24)
        }
        .margin(10)
      }

      ListItemGroup({ header: this.header('D') }) {
        ListItem() {
          Text('长沙').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('重庆').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('成都').fontSize(24)
        }
        .margin(10)
      }

      ListItemGroup({ header: this.header('E') }) {
        ListItem() {
          Text('长沙').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('重庆').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('成都').fontSize(24)
        }
        .margin(10)
      }

      ListItemGroup({ header: this.header('F') }) {
        ListItem() {
          Text('长沙').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('重庆').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('成都').fontSize(24)
        }
        .margin(10)
      }

      ListItemGroup({ header: this.header('G') }) {
        ListItem() {
          Text('长沙').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('重庆').fontSize(24)
        }
        .margin(10)

        ListItem() {
          Text('成都').fontSize(24)
        }
        .margin(10)
      }
    }
    .height(300)
    .divider({
      strokeWidth: 1,
      color: Color.Blue
    })
    //设置头部吸顶效果
    .sticky(StickyStyle.Header)
    .onScrollIndex((firstIndex: number) => {
      console.error(`+++++++${firstIndex}`);
      this.selectedIndex = firstIndex;
    })
  }
}