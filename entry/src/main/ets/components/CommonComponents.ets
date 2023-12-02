@Component
export struct Header{
  private title: ResourceStr
  build(){
    // 标题部分
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(30)
      Text(this.title)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank()
      Image($r('app.media.ic_public_refresh'))
        .width(30)
    }
    .width('100%')
    .height(30)
  }
}