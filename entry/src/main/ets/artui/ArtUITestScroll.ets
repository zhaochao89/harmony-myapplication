@Entry
@Component
export  struct ArtUITestScroll {
  @State message: string = 'Hello World';
  private scroller: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Column() {
      Scroll(this.scroller) {
        Column(){
          ForEach(this.arr, (item: number, index: number) => {
            Text(`${item.toString()}--${index.toString()}`)
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(16)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({top: 10})
          }, (item: number) => item.toString())
        }
        .width('100%')
      }
      .height(300)
      .backgroundColor(Color.Gray)
      .scrollable(ScrollDirection.Vertical) //滚动方向为垂直方向
      .scrollBar(BarState.On) //滚动条常驻显示
      .scrollBarColor(Color.Red) //滚动条颜色
      .scrollBarWidth(10) //滚动条宽度
      .edgeEffect(EdgeEffect.Spring) //滚动到边沿后回弹

      Scroll(this.scroller) {
        Row(){
          ForEach(this.arr, (item: number, index: number) => {
            Text(`${item.toString()}--${index.toString()}`)
              .width(150)
              .height('90%')
              .backgroundColor(Color.White)
              .margin({right: 30})
              .borderRadius(16)
              .fontSize(16)
              .textAlign(TextAlign.Center)
          }, (item: number) => item.toString())
        }
      }
      .backgroundColor(Color.Gray)
      .height(300)
      .margin({top: 50})
      .scrollable(ScrollDirection.Horizontal)
      .edgeEffect(EdgeEffect.Spring)
    }
    .backgroundColor(Color.Red)
  }
}