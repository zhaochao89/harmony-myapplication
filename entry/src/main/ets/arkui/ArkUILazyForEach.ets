
@Component
export struct ArkUILazyForEach {
  private data: MyDataSource = new MyDataSource();

  build() {
    Row() {
      List() {
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            Text(item.toString())
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .size({ height: 100, width: '100%' })
          }
          .margin(10)
          .borderRadius(10)
          .backgroundColor(Color.White)
          .onClick(() => {
            this.data.deleteData(index);
            //这里要刷新一下数据，更新index索引，否则组件内的index还是之前的，删除会有问题
            this.data.reloadData();
          })
        }, (item: string, index: number) => item + index.toString()) //这里带上index作为标识
          .onMove((from: number, to: number) => {
            this.data.moveDataWithoutNotify(from, to);
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFDCDCDC')
      .cachedCount(5)
    }
  }

  aboutToAppear(): void {
    for (let index = 0; index < 100; index++) {
      this.data.pushData(index.toString());
    }
  }
}


class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos > 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach((listener) => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach((listener) => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach((listener) => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach((listener) => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach((listener) => {
      listener.onDataMove(from, to);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public moveDataWithoutNotify(from: number, to: number) {
    let temp = this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, temp[0]);
  }

  public pushData(data: string) {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }

  public reloadData() {
    this.notifyDataReload();
  }
}