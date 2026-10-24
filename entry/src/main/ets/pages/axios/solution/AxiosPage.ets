import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

//创建axios实例
const instance = axios.create({
  baseURL: 'http://192.168.1.108:3000',
  timeout: 1000
})

interface LoginData {
  phone: string
  code: string
}

@Entry
@Component
struct AxiosPage {
  @State phone: string = ''
  @State code: string = ''

  build() {
    Column({ space: 40 }) {

      TextInput({ placeholder: '请输入手机号码', text: this.phone })
        .type(InputType.PhoneNumber)
        .onChange((value) => {
          this.phone = value;
        })
      Row({ space: 10 }) {
        TextInput({ placeholder: '请输入验证码', text: this.code })
          .type(InputType.Number)
          .layoutWeight(1)
          .onChange((value) => {
            this.code = value;
          })
        Button('发送验证码')
          .onClick(() => {
            //发送get请求
            instance.get('/word/user/code', { params: {
              phone: this.phone
            } })
              .then((response: AxiosResponse) => {
                this.code = response.data.data
              })
              .catch((error: AxiosError) => {
                console.log(error.message)
              })
          })

      }.width('100%')

      Button('登录')
        .onClick(() => {
          //发送post请求
          const loginData: LoginData = {
            phone: this.phone,
            code: this.code
          }
          instance.post('/word/user/login', loginData)
            .then((response: AxiosResponse) => {
              console.log(JSON.stringify(response.data))
            })
            .catch((error: AxiosError) => {
              console.log(error.message)
            })
        })
        .width('90%')
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}