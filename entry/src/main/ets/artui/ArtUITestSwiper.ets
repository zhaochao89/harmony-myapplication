
@Component
export struct ArtUITestSwiper {

  build() {
    Swiper(){
      Text('0')
        .width('100%')
        .height(300)
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .fontSize(30)

      Text('1')
        .width('100%')
        .height(300)
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
        .fontSize(20)

      Text('2')
        .width('100%')
        .height(300)
        .backgroundColor(Color.Pink)
        .textAlign(TextAlign.Center)
        .fontSize(20)

      Text('3')
        .width('100%')
        .height(300)
        .backgroundColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .fontSize(20)
    }
    //设置是否无限循环
    .loop(true)
    //设置自动轮播
    .autoPlay(true)
    //自动轮播时间，单位毫秒
    .interval(2000)
    //自定义导航点样式
    .indicator(
      Indicator.dot()
        .right(10)
        .itemWidth(15)
        .itemHeight(15)
        .selectedItemWidth(30)
        .selectedItemHeight(15)
        .color(Color.Red)
        .selectedColor(Color.Blue)
    )
    //自定义箭头样式
    .displayArrow({
      showBackground: true,
      isSidebarMiddle: true,
      backgroundSize: 24,
      backgroundColor: Color.White,
      arrowSize: 18,
      arrowColor: Color.Blue
    })
    //设置轮播方向是否为垂直方向
    .vertical(false)
    //设置一个页面同时显示2个子组件
    .displayCount(2)
  }
}