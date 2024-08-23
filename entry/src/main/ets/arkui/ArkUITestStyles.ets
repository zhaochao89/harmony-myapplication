//@Styles仅支持通用属性和通用事件，不支持传参。可以定义在全局或组件内，定义在全局时需要在方法名前面添加function,
//在组件内定义不需要function关键字。只能在当前文件内使用，不支持export。

@Styles function MyStyles() {
  .width('100%')
}
//组件内的@Styles的优先级高于全局@Styles，框架优先找当前组件内的@Styles，找不到则会去全局查找。
@Component
export struct ArkUITestStyles {

  @State heightValue: number = 100

  //定义在组件内的@Styles可以通过this访问组件的常量和状态变量，并可以在@Styles里通过事件来改变状态变量的值。
  @Styles
  YourStyles() {
    .backgroundColor(Color.Blue)
    .height(this.heightValue)
    .onClick(() => {
      this.heightValue = 200;
    })
  }

  build() {
    Column() {
      Text('@Styles的使用').fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Center)
    .YourStyles()
    .MyStyles()
  }
}