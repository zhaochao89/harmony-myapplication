
/**
 * @AnimatableExtend装饰器用于自定义可动画的属性方法，在这个属性方法中修改组件不可动画的属性。
 * 在动画执行过程时，通过逐帧回调函数修改不可动画属性值，让不可动画属性也能实现动画效果。
 * 也可通过逐帧回调函数每帧修改可动画属性的值，实现逐帧布局的效果。
 * @AnimatableExtend仅支持全局定义，不支持在组件内定义。
 * @AnimatableExtend定义的函数参数类型必须为number类型或者实现AnimtableArithmetic<T>接口的自定义类型。
 * @AnimatableExtend定义的函数体内只能调用@AnimatableExtend括号内组件的属性方法。
 * */

@AnimatableExtend(Text)
function animatableWidth(width: number) {
  .width(width)
}

@Component
export struct ArkUITestAnimatableExtend {
  @State textWidth: number = 80;

  build() {
    Column({ space: 20 }){
      Text('AnimatableProperty')
        .animatableWidth(this.textWidth)
        .animation({ duration: 2000, curve: Curve.Ease })
      Button('Play')
        .onClick(() => {
          this.textWidth = this.textWidth == 80 ? 160 : 80;
        })
    }
    .width('100%')
    .padding(10)
  }
}