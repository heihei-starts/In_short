import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import About from '../components/about.vue'
import Contact from '../components/contact.vue'
import Show from '../components/show.vue'
import Register from '../components/register.vue'


Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/about', component: About },
    { path: '/contact', component: Contact },
    { path: '/register', component: Register},
    { path: '/show', component: Show}
  ],
})
