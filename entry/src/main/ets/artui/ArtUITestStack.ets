
const MTop: Record<string, number> = {'top': 10}
@Component
export struct ArtUITestStack {

  build() {
    Column(){
      //alignContent设置Stack容器内元素对齐方式
      Stack({ alignContent: Alignment.BottomEnd }) {
        Text('item1').width('90%').height('90%').backgroundColor('#ff58b87c').align(Alignment.Bottom)
        Text('item2').width('30%').height('30%').backgroundColor('#ff8ff3eb').align(Alignment.Center)
          .zIndex(1) //控制组件显示的层级，值越大显示的层级越高
        Text('item3').width('60%').height('60%').backgroundColor('#ffc3f6aa').align(Alignment.Top)
      }
      .height(300)
      .margin(MTop)
      .backgroundColor(Color.Red)
      StackExample()
        .height(400)
        .margin(MTop)
    }
    // .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Gray)
    .width('100%')
    .height('100%')
  }
}

@Component
struct StackExample {
  private arr: string[] = ['APP1', 'APP2', 'APP3', 'APP4', 'APP5'];

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.arr, (item:string) => {
          Text(item)
            .width(100)
            .height(100)
            .fontSize(16)
            .margin(10)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }, (item:string):string => item)
      }.width('100%').height('100%')

      Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
        Text('联系人').fontSize(16)
        Text('设置').fontSize(16)
        Text('短信').fontSize(16)
      }
      .width('50%')
      .height(50)
      .backgroundColor('#16302e2e')
      .margin({ bottom: 15 })
      .borderRadius(15)
    }.width('100%').height('100%').backgroundColor('#CFD0CF')
  }
}