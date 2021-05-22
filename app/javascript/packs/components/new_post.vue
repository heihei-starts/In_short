<template>
  <div class="container">
    <form action="/api/means_post" method="post">
      <div class="content_id">
        {{ tieContents(content_id, content_name, authenticity_token) }}
        <input type="hidden" name="authenticity_token" :value="token">
        <input type="hidden" name="content_id":value="id" >
      </div>
      <div class="Head">
        <h3>{{ name }}とは</h3>
      </div>
      <div class="form-group">
        <label　for="exampleFormControlTextarea1">投稿</label>
        <textarea class="form-control" row="3" name="meaning" id="exampleFormControlTextarea1"></textarea>
      </div>

      <div class="post">
        <button class="post_submit" type="submit">投稿</button>
      </div>


    </form>

  </div>

</template>

<script>
  //content_idを取得
  export default {

    data () {
      return {
        id: "",
        token: "",
        name: "",
      };
    },

    props: {
      content_id: {
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
      tieContents (content_id, content_name, token) {
        this.id = content_id;
        this.name = content_name;
        this.token = token;

      },

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
