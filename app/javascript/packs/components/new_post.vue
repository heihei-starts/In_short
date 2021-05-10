<template>
  <div class="container">
    <form action="/api/means_post" method="post">
      <div class="content_id">
        {{ tieContentId(content_id) }}
        {{ tieToken(authenticity_token) }}
        <input type="hidden" name="authenticity_token" :value="token">
        <input type="hidden" name="content_id":value="id" >

      </div>
      <div class="text">
        <label　for="toukou">投稿</label>
        <input type="textarea" name="meaning"id="toukou">
      </div>

      <div class="post">
        <button type="submit">投稿</button>
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
    },

    methods: {
      //propsのcontent_idをdataに入れる
      tieContentId (content_id) {
        this.id = content_id

      },
      tieToken (token) {
        this.token= token
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

<style></style>
