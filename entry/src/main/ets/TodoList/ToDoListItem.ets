import { ToDo } from './ToDo';

@Component
export struct ToDoListItem {
  @Link isEditMode: boolean;
  @Link selectedItems: ToDo[];
  private todoItem: ToDo = new ToDo('');

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Row() {
        SymbolGlyph($r('sys.symbol.circle'))
          .margin({ right: 20 })
        Text(this.todoItem.name)
        Blank()
        if (this.isEditMode) {
          Checkbox()
            .onChange((isSelected) => {
              if (isSelected) {
                this.selectedItems.push(this.todoItem); //勾选上时添加数据
              } else {
                let index = this.selectedItems.indexOf(this.todoItem);
                if (index !== -1) {
                  this.selectedItems.splice(index, 1); //取消勾选时移除数据
                }
              }
            })
        }
      }
      .width('100%')
    }
    .backgroundColor(Color.White)
    .height(56)
    .padding(16)
    .margin({ left: 16, right: 16 })
    .borderRadius(12)
    .gesture(
      GestureGroup(
        GestureMode.Exclusive,
        LongPressGesture()
          .onAction(() => {
            if (!this.isEditMode) {
              this.isEditMode = true; //进入编辑模式
            }
          })
      )
    )
  }
}