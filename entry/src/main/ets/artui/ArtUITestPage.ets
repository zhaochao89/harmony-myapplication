@Component
export struct ArtUITestPage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Text('text1')
        .width(200)
        .height(40)
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
      Text('text2')
        .width(200)
        .height(40)
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
      Text('text3')
        .width(200)
        .height(40)
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
      Row({ space: 35 }) {
        Row().height(150).backgroundColor(0xF5DEB3).layoutWeight(1)
        Row().height(150).backgroundColor(0xD2B48C)//设置子元素和兄弟元素在主轴上的权重
          .layoutWeight(2)//控制单个控件在交叉轴上的排列方式，优先级高于alignItems
          .alignSelf(ItemAlign.Start)
        Row().height(150).backgroundColor(0xF5DEB3).layoutWeight(1)
        //常用的空白填充组件
        Blank()
      }
      .backgroundColor(Color.White)
      .height(200)
      .alignItems(VerticalAlign.Bottom)

      Column().backgroundColor(Color.Blue).height(50).width('100%')
    }
    //控制布局在交叉轴上的排列方式
    .alignItems(HorizontalAlign.Start)
    //控制布局在主轴上的排列方式
    .justifyContent(FlexAlign.SpaceEvenly)
    .margin({
      left: 16,
      right: 16
    })
    .width(300)
    .height(500)
    .backgroundColor(Color.Gray)
  }
}