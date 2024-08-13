import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

@Component
export struct ArkTSPromise {
  @State message: string = 'world';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontColor(Color.Red)
          .onClick(async () => {
            this.message = '3s后变化';
            const result = await myAsyncFunction();
            this.message = result;
            let res = await testFunc();
            console.info('res is:' + res);
          })
      }
      .height('100%')
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

async function myAsyncFunction(): Promise<string> {
  const result: string = await new Promise((resolve: Function) => {
    setTimeout(() => {
      resolve('Hello World');
    }, 3000);
  });
  return result;
}
//文件写入
async function write(data: string, file: fileIo.File): Promise<void> {
  fileIo.write(file.fd, data)
    .then((writeLen: number) => {
    console.info('write data length is: ' + writeLen);
  })
    .catch((err: BusinessError) => {
      console.error(`Failed to write data. code is ${err.code}, message is ${err.message}`);
    })
}

async function testFunc(): Promise<boolean> {
  let context = getContext() as common.UIAbilityContext;
  let filePath: string = context.filesDir + '/test.txt'; //应用文件路径
  let file: fileIo.File = await fileIo.open(filePath, fileIo.OpenMode.READ_WRITE | fileIo
    .OpenMode.CREATE);
  write('Hello World', file)
    .then(() => {
      console.info('Succeeded in writing data.');
      fileIo.close(file);
    })
    .catch((err: BusinessError) => {
      console.error(`Failed to write data. Code is ${err.code}, message is ${err.message}`);
      fileIo.close(file);
    })
  let result = await fileIo.access(filePath, fileIo.AccessModeType.EXIST);
  if (!result) {
    return false;
  } else {
    return true;
  }
}