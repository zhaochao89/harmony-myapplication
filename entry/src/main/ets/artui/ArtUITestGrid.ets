
@Component
export struct ArtUITestGrid {
  @State services: Array<string> = ['直播', '进口', '精选'];

  build() {
    this.testGrid2();
  }

  @Builder testGrid2() {
    Column(){
      Grid(){
        ForEach(this.services, (service: string, index) => {
          GridItem(){
            Text(service)
          }
          .width('25%')
        }, (service: string):string => service)
      }
      .width('100%')
      .columnsTemplate('1fr 1fr')
      .rowsGap(15)
    }
  }

  @Builder testGrid() {
    Grid() {
      GridItem() {
        Text('text1')
      }
      .backgroundColor(Color.White)
      .padding(16)

      GridItem() {
        Text('text2')
      }
      .backgroundColor(Color.White)
      .padding(16)

      GridItem() {
        Text('text3')
      }
      .backgroundColor(Color.White)
      .padding(16)

      GridItem() {
        Text('text4')
      }
      .backgroundColor(Color.White)
      .padding(16)

      GridItem() {
        Text('text5')
      }
      .backgroundColor(Color.White)
      .padding(16)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f1f3f5')
    // .columnsTemplate('1fr 2fr 1fr')
    .rowsTemplate('1fr 1fr 1fr')
    // layoutDirection属性仅在不设置rowsTemplate和columnsTemplate时生效
    // .layoutDirection(GridDirection.Column)
    // .maxCount(2)
    //设置行间距
    .rowsGap(15)
    //设置列间距
    .columnsGap(10)
  }
}