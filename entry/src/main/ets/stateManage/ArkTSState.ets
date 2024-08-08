/*
 * @State装饰的变量拥有其所属组件的状态，可以作为其子组件单向和双向同步的数据源。当其数值改变时，会引起相关组件的渲染刷新。
 * @Prop装饰的变量可以和父组件建立单向同步关系，@Prop装饰的变量是可变的，但修改不会同步回父组件。
 * @Link装饰的变量可以和父组件建立双向同步关系，子组件中@Link装饰变量的修改会同步给父组件中建立双向数据绑定的数据源，父组件的更新也会同步给@Link装饰的变量。
 * @Provide/@Consume装饰的变量用于跨组件层级（多层组件）同步状态变量，可以不需要通过参数命名机制传递，通过alias（别名）或者属性名绑定。
 * @Observed装饰class，需要观察多层嵌套场景的class需要被@Observed装饰。单独使用@Observed没有任何作用，需要和@ObjectLink、@Prop联用。
 * @ObjectLink装饰的变量接收@Observed装饰的class实例，应用于观察多层嵌套场景，和父组件的数据源构建双向同步。
 * 说明：仅@Observed/@ObjectLink可以观察嵌套场景，其他的状态变量仅能观察第一层。
 *
 * @Watch用于监听状态变量的变化。
 * $$运算符给内置组件提供TS变量的引用，使得TS变量和内置组件的内部状态保持同步。
 *
 * 状态管理V2版本：
 * 状态管理（V2试用版）提供了一套全新的装饰器
 * @ObservedV2装饰器装饰class，使得被装饰的class具有深度监听的能力。@ObservedV2和@Trace配合使用可以使class中的属性具有深度观测的能力。
 * @Trace装饰器装饰被@ObservedV2装饰的class中的属性，被装饰的属性具有深度观测的能力。
 * @ComponentV2：使用@ComponentV2装饰的struct中能使用新的装饰器。例如：@Local、@Param、@Event、@Once、@Monitor、@Provider、@Consumer。
 * @Local装饰的变量为组件内部状态，无法从外部初始化。
 * @Param装饰的变量作为组件的输入，可以接受从外部传入初始化并同步。
 * @Once装饰的变量仅初始化时同步一次，需要与@Param一起使用。
 * @Event装饰方法类型，作为组件输出，可以通过该方法影响父组件中变量。
 * @Monitor装饰器用于@ComponentV2装饰的自定义组件或@ObservedV2装饰的类中，能够对状态变量进行深度监听。
 * @Provider和@Consumer：用于跨组件层级双向同步。
 * @Computed：计算属性，在被计算的值变化的时候，只会计算一次。主要应用于解决UI多次重用该属性从而重复计算导致的性能问题。
 * !!语法：双向绑定语法糖。
 * */

@Component
export struct ArkTSState {
  @State message: string = 'Hello';
  @State map_value: Map<number, string> = new Map([[0, 'a'], [1, 'b'], [2, 'c']]);

  build() {
    Scroll() {
      Column({ space: 30 }) {
        Row(){
          Text(`父组件：${this.message}`).fontSize(30).fontColor(Color.Red)
        }
        .margin({ top: 30 })
        Child({ prop_value: this.message, link_value: this.message, state_value: this.message })
        Button('点击修改父组件的message')
          .onClick(() => {
            this.message = 'World!';
          })
        ForEach(Array.from(this.map_value.entries()), (item: [number, string]) => {
          Text(`${item[0]}——${item[1]}`).fontSize(30)
        })
        Button('init map').onClick(() => {
          this.map_value = new Map([[0, "a"], [1, "b"], [3, "c"]]);
        })
        Button('set new one').onClick(() => {
          this.map_value.set(4, "d");
        })
        Button('clear').onClick(() => {
          this.map_value.clear();
        })
        Button('replace the first one').onClick(() => {
          this.map_value.set(0, "aa");
        })
        Button('delete the first one').onClick(() => {
          this.map_value.delete(0);
        })
      }
      .backgroundColor(Color.Pink)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct Child {

  @Link link_value: string;
  @Prop prop_value: string = '这是子组件message';
  @State state_value: string = '这是@State变量';

  build() {
    Column({
      space: 20
    }){
      Text(`橙色是子组件`).fontSize(20).fontColor(Color.White)
      Text(`Prop的内容：${this.prop_value}`).fontSize(20)
      Text(`Link的内容：${this.link_value}`).fontSize(20)
      Text(`State的内容：${this.state_value}`).fontSize(20)
      Button('点击修改Prop的值')
        .onClick(() => {
          this.prop_value = '修改了Prop的内容';
        })
      Button('点击修改Link的值')
        .onClick(() => {
          this.link_value = '修改了Link的内容';
        })
    }
    .width('100%')
    .backgroundColor(Color.Orange)
    .padding({ top: 20, bottom: 20 })
  }
}