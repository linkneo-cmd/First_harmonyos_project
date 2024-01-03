import router from '@ohos.router'
class RouterInfo{
  //页面路径
  url: string
  //页面标题
  title: string

  constructor(url: string, title: string) {
    this.url = url
    this.title = title
  }
}

@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  private routers: RouterInfo[] = [
    new RouterInfo('pages/ImagePage', '图片查看案例'),
    new RouterInfo('pages/ItemPage', '商品列表案例'),
    new RouterInfo('pages/StatePage', 'Jack和他的女友案例'),
    new RouterInfo('pages/PropPage', '任务列表案例')
  ]
  build() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .height(80)

        List({space: 15}){
          ForEach(
            this.routers,
            (router, index) => {
              ListItem(){
                this.RouterItem(router, index + 1)
              }
            }
          )
        }
        .layoutWeight(1)
        .alignListItem(ListItemAlign.Center)
        .width('100%')
      }
      .width('100%')
      .height('100%')
  }

  @Builder
  RouterItem(r: RouterInfo, i: number){
    Row(){
      Text(i + '.')
        .fontSize(20)
        .fontColor(Color.White)
      Blank()
      Text(r.title)
        .fontSize(20)
        .fontColor(Color.White)
    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(20)
    .shadow({radius: 6, color: '#4F000000', offsetX:2, offsetY: 4})
    .onClick(() => {
      //router跳转
      router.pushUrl(
        {
          url: r.url,
          params: {id: i}
        },
        router.RouterMode.Single,
        err => {
          if(err){
            console.log(`路由失败。 errCode: ${err.code} errMsg: ${err.message}`)
          }
        }
      )
    })
  }
}