"use strict";
//任务类
class Task {
    constructor() {
        //任务名称
        this.name = `任务${Task.id++}`;
        //任务状态：是否完成
        this.finished = false;
    }
}
Task.id = 1;
//统一卡片样式
function card() {
    
  
        .width('95%')
        .padding(20)
        .backgroundColor(Color.White)
        .borderRadius(15)
        .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 });
}
//任务完成样式
function finishedTask() {
    
  
        .decoration({ type: TextDecorationType.LineThrough })
        .fontColor('#B1B2B1');
}
struct PropPage extends  {
    constructor(
//任务类
    //任务类
    ) {
        //任务类
    }
    build() {
            .width('100%')
            .height('100%')
            .backgroundColor('#F1F2F3');
    }
}
//# sourceMappingURL=PropPage.js.map