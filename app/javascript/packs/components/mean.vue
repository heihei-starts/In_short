<template>
  <div class="container">
    <div class="content_name">
      {{ tieContentName(con_name, current_user_id,authenticity_token) }}
      <h2>{{ content_name }}</h2>
    </div>
    <ul>
      <li v-for="mean in means" :key="mean.id">
        <!--ログインユーザーと、投稿のユーザidが一致した時、色を変える -->
        <template v-if="matchUserIdMeanId(mean.user_id)">
          <p class="red">hei{{ mean.meaning }}</p>
        </template>
        <template v-else>
          <p>{{ mean.meaning }}</p>
        </template>
         <span v-if="!isLogined">
            <button class="btn btn-success rounded-pill tomean py-0" type="button" @click="doGood(mean.id)"> {{ mean.good }}
            </button>
          </span>
         <hr>
         
      </li>
    </ul>
    <div class="center">
      <button class="btn btn-primary bottom_blank" type="button" @click="getContentId(means)">投稿ページ</button><span class="not_login" v-show="isLogined"> (投稿するには、ログインが必要です。)</span>
    </div>
      <button class="btn btn-link bottom_blank" type="button" onclick="location.href='/'">ホーム</button>
  </div>
  
</template>

<script>
  import axios from 'axios'
  //csrfのトークンをaxiosでリクエストするときに、headerに持たせる。
  axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }

  export default {

     props: {
      means: {
        type: Array
     },
     con_name: {
      type: String
     },
     current_user_id: {
      type: String //idなのに、string形でしか受け取れない。なぜだろう？
     },
     authenticity_token: {
      type: String
     },
    },

    data () {
      return {
        content_name: "",
        content_means: "",
        user_id: "",
        token: "",
        good: "",
        
      };
    },

    computed: {
      //ログインしているかチェック
      isLogined () {
        const user_token = this.token;
        //条件をどげんかせんといかん
        //値が入ってたら、user_token=true,入ってなかったら、user_token=false
        if (user_token) {
          return false;
        } else {
          return true;
        }
      },
      //いいねだけ取得
      getMeansGood () {
        return function (mean_id) {  axios.get('/api/means_good/' + mean_id)
            .then(response => console.log(response.data))
            .catch(error => console.log("error"))
        }
      },


    },

    methods: {
      //ログインユーザーと投稿のユーザーIDが一致するかを調べる。
      matchUserIdMeanId (mean_user_id) {
          //ログインしていないときは、0になってる
          var non_login = 0;
          //console.log(Number(this.user_id));
          //console.log(mean_user_id);
          if (Number(this.user_id) === non_login) {
            //ログインしてない時
            return false;
          } else if (Number(this.user_id) === Number(mean_user_id)){
            //ログインして、そのログインユーザーとmeaningのuser_idが一致する時
            return true;
          } else {
            //一致しない時
            return false;
          }
        
      },
      
      getContentId (means) {
        //インデックス0の値を取得
        const index0 = 0;
        //meansのインデックス0の時のcontent_idを取得
        let content_id = "";

        //console.log(means);
        //console.log(means[0]);
        //console.log(means[0].content_id);
        content_id = means[index0].content_id;
        //console.log(id);
        return location.href='/api/means_new/' + content_id;
      },
      
      //railsのviewから引っ張ってきた値を、dataに入れる。
      tieContentName(content_name, current_user_id, token) {
        this.content_name = content_name    ;
        this.user_id      = current_user_id ;
        this.token        = token;
        //console.log(this.user_id);
        //console.log(this.token);
      },


      //いいね送信メソッド
      //リクエストに謎の、goodシンボルがある。これはなくすべし。
       async doGood (mean_id) {
        await axios.post('/good/goods_post', {
          user_id: Number(this.user_id),
          mean_id: Number(mean_id), 
        })
        .then(this.getMeansGood(mean_id))
        .catch(error => console.log("error"))
      },


    }
    

  //結
  }


</script>

<style scoped>
.content_name h2 {
  text-align: center;
  border-bottom: groove;

}

.not_login {
  color: gray;

}

.center {
  text-align: center;
}
.red {
  color: red;
}

.bottom_blank {
  margin-bottom: 60px;
  margin-top: 50px;
}
</style>
