<template>
  <div class="container">
      <!--<p>コンテント内容を検索する。機能つける。</p> 
      <p>いいね削除機能</p> 
      <p>テスト</p> 
      <p>ui</p> 
      <p>ログインセッションを、controllerでする。</p> 
      <p>いいね即時反映</p>  -->
      <ul>
        <li class="content" v-for="content in contents" :key="content.id">
          {{ content.id }} : {{ content.content_name }}
          <button type="button" class=" btn btn-success rounded-pill tomean py-0 "  @click="fixedId(content.id)">is</button>
        </li>
      </ul>
  </div>

</template>



<script>
  import axios from 'axios';
  import New from './new_post.vue'

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
      fixedId (content) {
        location.href='/api/display/' + content
      }

      
    },

    components: {
      'newbar': New,
    }
   
  }
</script>
  

<style scoped>
.tomean {
  display: flex;
  flex-flow: column;
  justify-content:space-between;
}

.content {
}
</style>
