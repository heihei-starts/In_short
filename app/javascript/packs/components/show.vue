<template>
<p>{{ name }}</p>


</template>

<script>
  //axiosインストール
  import axios from "axios";

  export default {
    data () {
      return {
        name: "ヘイヘイ",
        props: ["id"],
        user: []
      }
    },

//    mounted: {
      //登録ユーザーごとのページにとぶ。俺どんな感じにするん？
//      setUser () {
//        axios.get('/api/register/')
//          .then(response => (
//           this.user = response.data
//          ))
//      }
//    } 
  }
</script>


<style>

</style>
