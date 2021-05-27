<template>
  <div class="container">
    <form action="/api/means_post" method="post">
      <div class="content_id">
        {{ tieContents(content_id, content_name, authenticity_token, use_id) }}
        <input type="hidden" name="authenticity_token" :value="token">
        <input type="hidden" name="content_id":value="con_id" >
        <input type="hidden" name="user_id" :value="user_id">
      </div>


      <div class="Head">
        <h3>{{ name }}とは</h3>
      </div>
      <div class="form-group">
        <label　for="exampleFormControlTextarea1">投稿</label>
        <textarea class="form-control" row="3" name="meaning" id="exampleFormControlTextarea1"></textarea>
      </div>

      <div class="post">
        <button class="btn btn-primary post_submit" type="submit">投稿</button>
      </div>
      <br>
      <div class="back">
        <button class="btn btn-link" type="button" @click="fixedId(con_id)">前のページに戻る</button>
        
      </div>


    </form>

  </div>

</template>

<script>
  //content_idを取得
  export default {

    data () {
      return {
        con_id: "",
        user_id: "",
        token: "",
        name: "",
      };
    },

    props: {
      content_id: {
        type: String
      },
      use_id: {
        type: String
      },
      //これやって大丈夫か不安
      authenticity_token: {
        type: String
      },
      content_name: {
        type: String
      }
    },


    methods: {
      //propsのcontent_idをdataに入れる
      tieContents (content_id, content_name, token, current_user_id) {
        this.con_id   = content_id      ;
        this.name     = content_name    ;
        this.token    = token           ;
        this.user_id  = Number(current_user_id) ;

      },

      fixedId (content_id) {
        location.href='/api/display/' + content_id
      }

    //  async doPost () {
      //  await axios.post('/api/means_post', {
        //  content_id: this.id,


      //  })

    //  }

    },

    mounted () {
  
    }
  }


</script>

<style>
  .Head h3 {
      text-align: center;
      font-family: "Helvetica Neue",
      Arial,
      "Hiragino Kaku Gothic ProN",
      "Hiragino Sans",
      Meiryo,
      sans-serif;
  }
  .post_submit {
      text-align: center;
  }

</style>
