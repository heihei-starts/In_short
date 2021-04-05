import Vue from 'vue/dist/vue.esm.js'
import Register from './components/register.vue'
import 'bootstrap/dist/css/bootstrap.css' 
import 'bootstrap-vue/dist/bootstrap-vue.css' 

var app = new Vue ({
    el: '#app',

    components: {
        'regbar': Register,
    }
})
