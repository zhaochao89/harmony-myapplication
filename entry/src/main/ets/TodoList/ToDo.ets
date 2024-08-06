import { util } from '@kit.ArkTS'

export class ToDo {
  key: string = util.generateRandomUUID(true);
  name: string;
  toDoData: ToDo[] = [];

  constructor(name: string) {
    this.name = name;
  }
}