
require('./bootstrap');

window.Vue = require('vue');


Vue.component('my-thought-component', require('./components/MyThoughtComponent.vue'));
Vue.component('form-component', require('./components/FormComponent.vue'));

Vue.component('thought-component', require('./components/ThoughtComponent.vue'));

const app = new Vue({
    el: '#app'
});
