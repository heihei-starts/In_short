<template>
  <div class="container">
    <div class="content_name">
      {{ tieContentName(con_name, current_user_id) }}
      <h2>{{ content_name }}</h2>
    </div>
    <ul>
      <li v-for="mean in means" :key="mean.id">
         {{ mean.meaning }} <span><button type="button" @click="doGood(mean.id)">{{ mean.good }}</button></span>
      </li>
    </ul>

    <button type="button" @click="getContentId(means)">投稿ページ</button>
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
    //display.html.erbからデータを取得

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
        user_id: "",
      };
    },

    methods: {
       
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
        //console.log(this.user_id);
      },

      //(仮) いいねメソッド

      //いいね送信メソッド
      //リクエストに謎の、goodシンボルがある。これはなくすべし。
      doGood (mean_id) {
        axios.post('/good/goods_post', {
          user_id: Number(this.user_id),
          mean_id: mean_id, 
        })
        .then(response => console.log("success"))
        .catch(error => console.log("error"))
      },

      addGoodPoints () {
        axios.post

      }

    }


  //結
  }


</script>

<style></style>
