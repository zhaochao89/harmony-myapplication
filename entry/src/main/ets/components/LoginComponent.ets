
@Component
export struct LoginComponent {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      RelativeContainer() {
        Row() {
          Text('用户名：')
            .margin({
              right: 4
            })
          TextInput()
            .backgroundColor(Color.White)
            .margin({
              right: 16
            })
        }
        .margin({
          top: 32,
          left: 16,
          right: 16
        })
      }
      .backgroundColor(Color.Gray)
      .width('100%')
      .height('50%')
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center},
      })
    }
    .backgroundColor(Color.White)
    .width('100%')
    .height('100%')
  }
}