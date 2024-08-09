/*
 * @Prop装饰器：父子单向同步
 * @Prop装饰的变量可以和父组件建立单向的同步关系。@Prop装饰的变量是可变的，但是变化不会同步回其父组件。
 * @Prop装饰变量时会进行深拷贝，不能在@Entry装饰的自定义组件中使用。
 * @Prop装饰的数据更新依赖其所属自定义组件的重新渲染，所以在应用进入后台后，@Prop无法刷新，推荐使用@Link代替。
 * */
@Component
export struct ArkTSProp {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }){
      Text(this.message).fontSize(30).fontColor(Color.Red)
      Child({ message: this.message })
      Button('点我')
        .onClick(() => {
          this.message = '点击了父组件';
        })
    }
    .height('100%')
  }
}

@Component
struct Child {
  @Prop message: string;
  //当装饰的类型是Object或者class复杂类型时，可以观察到第一层的属性的变化，属性即Object.keys(observedObject)返回的所有属性。
  @Prop person: Person = new Person('张三');

  build() {
    Row({ space: 30 }) {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Orange)
        .onClick(() => {
          this.message = '点击了子组件';
        })
      Text(this.person.name)
        .fontSize(20)
        .fontColor(Color.White)
        .onClick(() => {
          this.person.name = '李四';
        })
    }
    .backgroundColor(Color.Gray)
  }
}

class Person {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}
