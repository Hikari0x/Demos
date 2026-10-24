import router from '@ohos.router'

interface RouterParams {
  name: string
}

@Entry
@Component
struct EndPage {
  build() {
    Column({ space: 50 }) {
      Text('EndPage')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Blank()
      Button('打印参数')
        .onClick(() => {
          const params = router.getParams() as RouterParams
          console.log(`name:${params.name}`)
        })
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding({ top: 200, bottom: 200 })
  }
}