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

  deleteData() {
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

        // Blank()
      }
      .backgroundColor('#fff1f3f5')
      .height('100%')

      if (this.isEditMode) {
        Button('删除')
          .width('90%')
          .backgroundColor(Color.Red)
          .fontColor(Color.White)
          .fontSize(16)
          .onClick(() => {
            this.deleteData();
          })
      }
    }
  }
}