
@Component
export struct ArtUITestGridRow {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  build() {
    GridRow({
      columns: 6, //设置排列多少列
      direction: GridRowDirection.RowReverse, //设置子元素的排列方向
      // gutter: 10, //同时设置子元素在水平和垂直方向上的间距
      gutter: {x: 20, y: 10}, //可以单独设置水平和垂直方向上的间距
    }) {
      ForEach(this.bgColors, (color:Color, index?:number|undefined) => {
        GridCol({
          span: 2, //设置元素占用几列的空间
          // offset: 2, //设置元素偏移的列数
          order: this.bgColors.length - index! //设置元素的序号，order小的元素在前，较大的在后
          // span: {
          //   xs: 2, // 在最小宽度类型设备上，栅格子组件占据的栅格容器2列。
          //   sm: 3, // 在小宽度类型设备上，栅格子组件占据的栅格容器3列。
          //   md: 4, // 在中等宽度类型设备上，栅格子组件占据的栅格容器4列。
          //   lg: 6, // 在大宽度类型设备上，栅格子组件占据的栅格容器6列。
          //   xl: 8, // 在特大宽度类型设备上，栅格子组件占据的栅格容器8列。
          //   xxl: 12 // 在超大宽度类型设备上，栅格子组件占据的栅格容器12列。
          // }
        }) {
          Row() {
            Text(`${index}`)
          }.width("100%").height('50vp')
        }.backgroundColor(color)
      })
    }
  }
}