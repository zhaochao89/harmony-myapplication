//装饰器：@Builder、@BuilderParam
import { text } from '@kit.ArkGraphics2D';

@Component
export struct ArtUITestDecorators {
  @State message: string = 'Hello World!';

  @Builder
  customHelloBuilder1() {
    Row() {
      Text('Hello').fontSize(20).fontColor(Color.Red)
    }
  }
  @Builder
  customHelloBuilder2() {
    Row() {
      Text('World').fontSize(20).fontColor(Color.Red)
    }
  }

  build() {
    Row() {
      Column({ space: 20 }){
        this.overBuilder({ paramA1: this.message })
        this.overBuilder2(this.message)
        Button('切换Hello World')
          .width('80%')
          .height(40)
          .backgroundColor(Color.Green)
          .onClick(() => {
            this.message = this.message === 'Hello World!' ? 'Art UI!' : 'Hello World!';
          })

        HelloComponent()
        HelloComponent({ message: 'hello', customBuilderParam: this.customHelloBuilder1 })
        HelloComponent({ message: 'world', customBuilderParam: this.customHelloBuilder2 })
          .backgroundColor(Color.Gray)
        //当自定义组件内有且仅有一个使用@BuilderParam装饰的属性，可以使用尾随闭包的形式初始化组件。这种情况下不支持使用通用属性。
        HelloComponent({ message: 'hello world'}) {
          Text('Hello World').fontSize(20).fontColor(Color.Red)
        }
      }
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

  //只有传入一个参数，且参数需要直接传入对象字面量才会按引用传递该参数，其余传递方式均为按值传递。
  //按引用传递参数时，如果在@Builder方法内调用自定义组件或者其他@Builder方法，ArkUI提供$$作为按引用传递参数的范式。
  @Builder
  overBuilder($$: Tmp) {
    Row(){
      Column(){
        Text(`overBuilder===${$$.paramA1}`)
        HelloComponent({ message: $$.paramA1 })
      }
    }
  }
  //按值传递参数：当传递的参数为状态变量时，状态变量的改变不会引起@Builder方法内的UI刷新，所以当使用状态变量时推荐使用按引用传递。
  @Builder
  overBuilder2(paramA1: string) {
    Row(){
      Column(){
        Text(`overBuilder2===${paramA1}`)
        HelloComponent({ message: paramA1 })
      }
    }
  }
}

@Component
struct HelloComponent {
  @Prop message: string;

  @Builder customBuilder() {}

  //@BuilderParam装饰的方法只能被自定义构建函数（@Builder装饰的方法）初始化，用来为自定义组件增加特定的功能。
  @BuilderParam customBuilderParam: () => void = this.customBuilder;
  build() {
    Column(){
      Text(`HelloComponent===${this.message}`)
      this.customBuilderParam();
    }
  }
}

class Tmp {
  paramA1: string = ''
}