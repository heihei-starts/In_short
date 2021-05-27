import Vue from 'vue/dist/vue.esm.js'
import New from './components/new_post.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
//import Vuetify from "vuetify"; 
//import "vuetify/dist/vuetify.min.css";

//Vue.use(Vuetify); // 追加
//const vuetify = new Vuetify(); // 追加

var app = new Vue ({
 // vuetify, 
  el: '#app',

  components: {
    'newbar': New,
  },


})
