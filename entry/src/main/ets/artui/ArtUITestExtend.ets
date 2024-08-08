//@Extend仅支持在全局定义，不支持在组件内定义。只能在当前文件中使用，不支持export。
//@Extend支持封装指定组件的私有属性、私有事件和自身定义的全局方法。
//@Extend装饰的方法支持参数，可以在调用时传参。

@Extend(Text)
function fancy() {
  .fontColor(Color.Red)
}

@Extend(Text)
function superFancyText(size: number) {
  .fontSize(size)
  .fancy()
}
//@Extend装饰的方法的参数可以是function，作为Event事件的句柄。
@Extend(Text)
function makeMeClick(onClick: () => void) {
  .backgroundColor(Color.Blue)
  .fontColor(Color.White)
  .height(100)
  .onClick(onClick)
}
//@Extend的参数可以是状态变量，当状态变量改变时，UI可以正常的被刷新渲染。
@Extend(Text)
function changeTextSize(size: number) {
  .fontSize(size)
}

@Component
export struct ArtUITestExtend {
  @State message: string = 'Click me';
  @State sizeValue: number = 20;

  build() {
    Column({ space: 20 }) {
      Text('@Extend的使用').superFancyText(20);
      Text('@Extend的使用').superFancyText(30);
      Text(this.message)
        .makeMeClick(() => {
        this.message = '我被点击了';
        this.sizeValue = 30;
      })
        .changeTextSize(this.sizeValue);
    }
    .width('100%')
  }
}