import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
export struct ArkTSTaskPool {

  build() {
    Text('TaskPool')
      .fontSize(20)
      .onClick(() => {
        taskPoolExecute();
      })
  }
}

@Concurrent
async function asyncFunc(val1: number, val2: number): Promise<number> {
  let ret: number = await new Promise((resolve, reject) => {
    let value = val1 + val2;
    resolve(value);
  });
  return ret;
}

function taskPoolExecute() {
  taskpool.execute(asyncFunc, 10, 20)
    .then((result: Object) => {
      console.info('taskPoolTest task result ' + result);
    })
    .catch((err: BusinessError) => {
      console.error("taskPoolTest test occur error: " + err);
    })
}