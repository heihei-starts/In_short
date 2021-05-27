import Vue from 'vue/dist/vue.esm.js'
import Mean from './components/mean.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
//import Vuetify from "vuetify";
//import "vuetify/dist/vuetify.min.css";

//Vue.use(Vuetify)
//const vuetify = new Vuetify();
import axios from 'axios'
var app = new Vue ({

  //vuetify,
  components: {
    'meanbar': Mean,
  }


}).$mount('#app')
