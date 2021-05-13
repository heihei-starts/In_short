<template>
  <div class="container">
    <div class="content_name">
      {{ tieContentName(con_name) }}
      <h2>{{ content_name }}</h2>
    </div>
    <ul>
      <li v-for="mean in means" :key="mean.id">
        {{ mean.content_id }}:  {{ mean.meaning }}
      </li>
    </ul>
    <button type="button" @click="getContentId(means)">投稿ページ</button>
  </div>

</template>

<script>
  
  export default {
    //display.html.erbからデータを取得
    props: {
      means: {
        type: Array
     },
     con_name: {
      type: String
     },
    },

    data () {
      return {
        content_name: "",
      };
    },

    methods: {
      
      getContentId (means) {
        //インデックス0の値を取得
        const index0 = 0
        //meansのインデックス0の時のcontent_idを取得
        let content_id = "";

        //console.log(means);
        //console.log(means[0]);
        //console.log(means[0].content_id);
        content_id = means[index0].content_id;
        //console.log(id);
        return location.href='/api/means_new/' + content_id;
      },

      tieContentName(name) {
        this.content_name = name;
      },

    }

  }


</script>

<style></style>
