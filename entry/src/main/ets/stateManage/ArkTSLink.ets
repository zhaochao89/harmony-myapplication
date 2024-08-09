/*
 * 子组件中被@Link装饰的变量与其父组件中对应的数据源建立双向数据绑定。
 * @Link装饰器不能在@Entry装饰的自定义组件中使用。
 * @Link装饰的变量禁止本地初始化。
 * */

@Component
export struct ArkTSLink {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 30 }) {
      Text(this.message)
        .fontSize(30)
        .onClick(() => {
          this.message = 'World，Hello';
        })
      Child({ message: this.message })
    }
  }
}

@Component
struct Child {
  @Link message: string;

  build() {
    Row() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Red)
        .onClick(() => {
          this.message = 'child内修改';
        })
    }
  }
}