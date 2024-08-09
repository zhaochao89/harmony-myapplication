/*
 * @Provide和@Consume，应用于与后代组件的双向数据同步，应用于状态数据在多个层级之间传递的场景。
 * 不同于父子组件之间通过命名参数机制传递，@Provide和@Consume摆脱参数传递机制的束缚，实现跨层级传递。
 * 其中@Provide装饰的变量是在祖先组件中，可以理解为被“提供”给后代的状态变量。@Consume装饰的变量是在后代组件中，去“消费（绑定）”祖先组件提供的变量。
 * */
@Component
export struct ArkTSProvide {
  @Provide selectedDate: Date = new Date('2021-08-08');

  build() {
    Scroll() {
      Column() {
        Button('parent increase the day by 1')
          .margin(10)
          .onClick(() => {
            this.selectedDate.setDate(this.selectedDate.getDate() + 1);
          })
        Button('parent update the new date')
          .margin(10)
          .onClick(() => {
            this.selectedDate = new Date('2024-08-09')
          })
        DatePicker({
          start: new Date('1970-01-01'),
          end: new Date('2100-01-01'),
          selected: this.selectedDate
        })
        CompC()
      }
    }
  }
}

@Component
struct CompD {

  @Consume selectedDate: Date;

  build() {
    Column() {
      Button('child increase the day by 1')
        .onClick(() => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1)
        })
      Button('child update the new date')
        .margin(10)
        .onClick(() => {
          this.selectedDate = new Date('2023-07-07');
        })
      DatePicker({
        start: new Date('1970-01-01'),
        end: new Date('2100-01-01'),
        selected: this.selectedDate
      })
    }
  }
}

@Component
struct CompC {

  build() {
    CompD()
  }
}