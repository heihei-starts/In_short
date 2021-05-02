<template>
  <div class="container">
      <ul>
        <!--ここをbuttonタグに変えて、クリックすると、その単語の意味が出てくる。 -->
        <li v-for="content in contents" :key="content.id">
          {{ content.content_name }}
        </li>

      </ul>
  </div>

</template>



<script>
  import axios from 'axios';

  export default {
    data () {
      return {
        contents: ""
      };
    },

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
    },
   
  }
</script>
  

<style>

</style>
