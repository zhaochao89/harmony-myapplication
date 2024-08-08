//stateStyles可以依据组件的内部状态的不同，快速设置不同样式。
//stateStyles是属性方法，可以根据UI内部状态来设置样式，类似于css伪类，但语法不同。ArkUI提供以下五种状态：
//
// focused：获焦态。
//
// normal：正常态。
//
// pressed：按压态。
//
// disabled：不可用态。
//
// selected10+：选中态。
@Component
export struct ArtUITestStateStyles {
  @State focusedColor: Color = Color.Black;
  pressedColor: Color = Color.Green;

  @Styles
  normalStyle() {
    .backgroundColor(Color.Red)
  }

  build() {
    Column({ space: 20 }) {
      Button('Button1')
        .fontColor(Color.White)
        .stateStyles({
          focused: {
            //stateStyles可以通过this绑定组件内的常规变量和状态变量。
            .backgroundColor(this.focusedColor)
          },
          pressed: {
            .backgroundColor(this.pressedColor)
          },
          //配合@Styles使用
          normal: this.normalStyle
        })
        .onClick(() => {
          this.focusedColor = Color.Pink;
        })
      Button('Button2')
        .fontColor(Color.White)
        .stateStyles({
          focused: {
            .backgroundColor('#ffffeef0')
          },
          pressed: {
            .backgroundColor('#ff707070')
          },
          //配合@Styles使用
          normal: this.normalStyle
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}