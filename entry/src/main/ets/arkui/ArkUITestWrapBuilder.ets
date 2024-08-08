
//全局@Builder作为wrapBuilder的参数返回WrappedBuilder对象，实现全局@Builder可以进行赋值和传递。
@Builder
function MyBuilder(value: string, size: number) {
  Text(value).fontSize(size).fontColor(Color.Red)
}

@Builder
function  YourBuilder(value: string, size: number) {
  Text(value).fontSize(size).fontColor(Color.Green)
}
//wrapBuilder方法只能传入全局@Builder方法。wrapBuilder方法返回的WrappedBuilder对象的builder属性方法只能在struct内部使用。
let globalBuilder: WrappedBuilder<[string, number]> = wrapBuilder(MyBuilder);
const builderArr: WrappedBuilder<[string, number]>[] = [wrapBuilder(MyBuilder), wrapBuilder(YourBuilder)];

@Builder
function TmpBuilder(value: Tmp) {
  Text(value.param).fontSize(30).fontColor(Color.Blue);
}
//通过按引用传递的方式传参，会触发UI的刷新。
const tmpWrappedBuilder: WrappedBuilder<[Tmp]> = wrapBuilder(TmpBuilder);

@Component
export struct ArkUITestWrapBuilder {

  @State message: string = 'Hello World';
  @State label: Tmp = new Tmp();

  build() {
    Row(){
      Column({ space: 20 }){
        globalBuilder.builder(this.message, 20);
        MyBuilder('直接使用', 30);
        //使用wrapBuilder数组进行不同Builder函数的渲染
        ForEach(builderArr, (item: WrappedBuilder<[string, number]>, index: number) => {
          if (index == 1) {
            item.builder('这是第二条渲染数据', 30);
          } else {
            item.builder('数组使用', 20);
          }
        })
        tmpWrappedBuilder.builder({ param: this.label.param });
        Button('Click me')
          .onClick(() => {
            this.label.param = '哈哈哈哈哈哈';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

class Tmp {
  param: string = 'hello';
}