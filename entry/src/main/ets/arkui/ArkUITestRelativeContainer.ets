
@Component
export struct ArkUITestRelativeContainer {
  build() {
    RelativeContainer() {
      Row().width(100).height(100)
        .backgroundColor('#FF3333')
        .alignRules({
          'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
          'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
        })
        .id('row1')
      Row().width(100).height(100)
        .backgroundColor('#FFCC00')
        .alignRules({
          'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
          'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
        })
        .id('row2')
      Row().width(100).height(100)
        .backgroundColor(Color.Blue)
        .alignRules({
          'top': { 'anchor': 'row1', 'align': VerticalAlign.Bottom },
          'left': { 'anchor': 'row1', 'align': HorizontalAlign.Start }
        })
        .id('row3')
        //offset设置相对布局的偏移量
        .offset({
          x: 10,
          y: 20
        })
      Row().width(100).height(100)
        .backgroundColor(Color.Green)
        .alignRules({
          'top': { 'anchor': 'row3', 'align': VerticalAlign.Bottom },
          'left': { 'anchor': 'row2', 'align': HorizontalAlign.Start }
        })
        .offset({
          x: -20
        })
    }
    .border({
      width: 1,
      color: Color.Blue
    })
    .width(300).height(300)
    .margin({left: 20})
  }
}