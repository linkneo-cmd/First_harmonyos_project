import router from '@ohos.router'
@Entry
@Component
struct AnimationPage {
  // 小鱼坐标
  @State fishX: number = 200
  @State fishY: number = 180
  // 小鱼角度
  @State angle: number = 0
  // 小鱼图片
  @State src: Resource = $r('app.media.fish')

  // 是否开始游戏
  @State isBegin: boolean = false

  build() {
    Row() {
      Stack(){
        // 返回按钮
        Button('返回')
          .position({x:0, y: 0})
          .backgroundColor('#20101010')
          .onClick(() => {
            // 返回上一页
            router.back()
          })

        if(!this.isBegin){
          // 开始按钮
          Button('开始游戏')
            .onClick(() => {
              animateTo(
                {duration: 1000},
                () => {
                  // 点击后显示小鱼
                  this.isBegin = true
                }
              )
            })
        }else{
          // 小鱼图片
          Image(this.src)
            .position({x: this.fishX - 20, y: this.fishY - 20})
            .rotate({angle:this.angle, centerX: '50%', centerY: '50%'})
            .width(40)
            .height(40)
              //.animation({duration: 500, curve: Curve.Smooth})
            .transition({
              type: TransitionType.Insert,
              opacity: 0,
              translate: {x: -250}
            })
        }
        // 操作按钮
        Row(){
          Button('←').backgroundColor('#20101010')
            .onClick(() => {
              animateTo(
                {duration: 500},
                () => {
                  if(this.fishX >= 10){
                    this.fishX -= 20
                  }
                  this.src = $r('app.media.fish_rev')
                }
              )
            })
          Column({space: 40}){
            Button('↑').backgroundColor('#20101010')
              .onClick(() => {
                animateTo(
                  {duration: 500},
                  () => {
                    if(this.fishY >= 10){
                      this.fishY -= 20
                    }
                  }
                )
              })
            Button('↓').backgroundColor('#20101010')
              .onClick(() => {
                animateTo(
                  {duration: 500},
                  () => {
                    if(this.fishY <= 340){
                      this.fishY += 20
                    }
                  }
                )
              })
          }
          Button('→').backgroundColor('#20101010')
            .onClick(() => {
              animateTo(
                {duration: 500},
                () => {
                  if(this.fishX <= 760){
                    this.fishX += 20
                  }
                  this.src = $r('app.media.fish')
                }
              )
            })
        }
        .height(240)
        .width(240)
        .justifyContent(FlexAlign.Center)
        .position({x:0,y:120})
      }
      .height('100%').width('100%')
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.sea'))
    .backgroundImageSize({height: '105%', width: '100%'})
  }
}