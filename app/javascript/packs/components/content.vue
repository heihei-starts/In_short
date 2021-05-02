<template>
  <div class="container">
      <ul>
        <!--ここをbuttonタグに変えて、クリックすると、その単語の意味が出てくる。 -->
        <li v-for="content in contents" :key="content.id">
          {{ content.id }} : {{ content.content_name }}
          <button type="button" @click="stateId(content.id)">ここ</button>
        </li>
      </ul>
  </div>

</template>



<script>
  import axios from 'axios';

  export default {
    data () {
      return {
        contents: "",
        current_id: 1,
      };
    },
  
    //content.vueがマウントされた時に、出力
    mounted () {
     this.getContents();
    },

    methods: {
      //contentsテーブルからデータ取得
      getContents () {
        axios.get('api/contents')
          .then(response => (this.contents = response.data))
          .catch(error => (console.log("error")))
      },
  
      //id固定メソッド
      stateId (content) {
        location.href='/api/display/' + content
      }

      
    },
   
  }
</script>
  

<style>

</style>
