<template>
    <div class="container">
        
        <div class="Head">
            <h1>In-short</h1>


        </div>
        <form action="/user:s" method="post"> 
    
            <div class="form-top">
                <p>以下の項目に答え、(送信)ボタンを押してください</p>
            </div>

            <div class="form-middle">
                <div class="form-group">
                    <label for="name">名前</label>
                    <input type="text" class="form-control"  name="name"　placeholder="名前を入力してください。" v-model="name">
                    <p v-if="isInvalidName" class="error">※名前が入力されていません。空白のバリデーション機能をつける。</p>
                </div>

                <div class="form-group">
                    <label for="email">メール</label>
                    <input type="email" class="form-control" name="email" placeholder="メールアドレスを入力してください。" v-model="email">
                    <p v-if="isInvalidEmail" class="error">※正しいメールアドレスを入力してください。</p>
                </div>

                <div class="form-group">
                    <label for="password">パスワード</label>
                    <input type="password" class="form-control" name="password" placeholder="パスワードを入力してください。" v-model="password">
                    <p v-if="isInvalidPass" class="error">※8文字以上入力してください。空白は認められません。</p>
                </div>
                
                <div class="formm-group">
                    <label for="password_confirmation">パスワード再入力</label>
                    <input type="password" class="form-control" name="password_confirmation" placeholder="パスワードをもう一度入力してください。" v-model="password_confirmation">
                    <p v-if="isInvalidPass_conf" class="error">※パスワードと値が違います。</p>
                </div>

            </div>

            <div class="form-bottom"> 
                <button type="submit" class="btn btn-primary">登録</button>
            </div>
        
        </form>
    </div>
</template>


<script>
  //inputの入力をdataに入れて、methodsでバリデーションメソッドを作る、
  import axios from 'axios'
   export default {

    data () {
            return {
                name:""                 ,
                email:""                ,
                password:""             ,
                password_confirmation:"",
 
 //showアクションようid
            };
    },


   computed: {

    //nameのバリデーション
        isInvalidName() {
            const val = this.name;
            return !val.value;
        },
        //emailのバリデーション
        isInvalidEmail() {
            const reg = new RegExp(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/);
            return !reg.test(this.email);
        },
        
        //passwordのバリデーション
        isInvalidPass() {
            const pas = this.password;
            const occurErr = pas.length <= 7;
            return occurErr;
        },
        //password_configのバリデーション
        isInvalidPass_conf() {
            return !(this.password === this.password_confirmation);
        }

      

   },

   methods: {


//        sendShow () {
          //show アクションにとばす
//          console.log("success")
//          axios.get('/api/registers/1')//ここのurlをshowアクションへのものにする
//            .then(response => (self.$router.push("/show")))//show.vueにいくhh
//            .catch(error => (console.log("失敗ちゃ")))
//        },
       // axiosで、post通信
//        async doPost () {
//             await axios.post('/api/registers',{
//            name: this.name,
//            email: this.email,
//            password: this.password,
//            password_confirmation: this.password_confirmation
//          })
//            .then(response =>(this.sendShow()))
//            .catch(error => (console.log("false")))
          


//        } 
   }
  }     
   
</script>


<style lang='scss' scoped>
    
    .Head h1 {
        font-size:50px;
        text-align:center;
        font-family: 'Londrina Solid', cursive;
    }

   .form-top p {
    text-align: center;
    font-size: 20px;
    border-bottom: groove;
   }   
    
   .form-bottom {
        margin-top: 10px;
        text-align: center;
   }
   .btn {
        font-size: 25px;
   }

   .error {
    color: red;
   }
</style>
