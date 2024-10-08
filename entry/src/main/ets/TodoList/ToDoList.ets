import { ToDo } from './ToDo';
import { ToDoListItem } from './ToDoListItem';

@Component
export struct ToDoList {
  @State toDoData: ToDo[] = [];
  @Watch('onEditModeChange') @State isEditMode: boolean = false;
  @State selectedItems: ToDo[] = []
  private availableThings: string[] = ['读书', '运动', '旅游', '听音乐', '看电影', '唱歌']

  onEditModeChange() {
    if (!this.isEditMode) {
      this.selectedItems = [];
    }
  }
  //声明箭头函数，组件的事件方法可以直接调用，不需要bind this
  deleteData = () => {
    this.selectedItems.forEach((todo: ToDo) => {
      let index = this.toDoData.indexOf(todo);
      if (index !== -1) {
        this.toDoData.splice(index, 1);
      }
    })
    this.isEditMode = false;
  }


  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Text('Top Row').fontSize(40).textAlign(TextAlign.Center).width('100%')
        }
        .backgroundColor('#F08080')
        //设置顶部绘制延伸到状态栏
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
        Row() {
          if (this.isEditMode) {
            Text('X')
              .fontSize(20)
              .onClick(() => {
                this.isEditMode = false;
              })
              .margin({ left: 20, right: 20 })
          } else {
            Text('待办')
              .fontSize(36)
            Blank()
            Text('+')
              .fontSize(36)
              .onClick(() => {
                TextPickerDialog.show({
                  range: this.availableThings,
                  onAccept: (value: TextPickerResult) => {
                    let arr = Array.isArray(value.index) ? value.index : [value.index];
                    for (let i = 0; i < arr.length; i++) {
                      this.toDoData.push(new ToDo(this.availableThings[arr[i]]));
                    }
                  }
                })
              })
          }
        }
        .width('100%')
        .padding({ left: 16, right: 32, bottom: 16 })

        List({ space: 20 }) {
          ForEach(this.toDoData, (toDoItem: ToDo) => {
            ListItem() {
              ToDoListItem({
                isEditMode: this.isEditMode,
                todoItem: toDoItem,
                selectedItems: this.selectedItems
              })
            }
          }, (todoItem: ToDo) => todoItem.key.toString())
        }
        Blank()
        Row() {
          Text('Bottom Row').fontSize(40).textAlign(TextAlign.Center).width('100%')
        }
        .backgroundColor(Color.Orange)
        //设置顶部绘制延伸到导航条
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
      }
      .backgroundColor('#fff1f3f5')
      .height('100%')

      if (this.isEditMode) {
        Button('删除')
          .width('90%')
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .fontSize(16)
          .onClick(this.deleteData)
      }
    }
  }
}