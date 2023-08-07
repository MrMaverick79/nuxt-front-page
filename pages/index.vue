<script setup>
import LoginForm from '../components/LoginForm.vue'
</script>

<template>
  <div class="vue-content">
    <header class="w-screen bg-red-600">
      <ul class="flex flex-row">
        <li class="p-2" v-if="isUserLoggedIn">
          <a href='#' @click="logOut">Logout</a>
        </li>
        <li class="p-2">
          Home
        </li>
        <li class="p-2" v-if="isUserLoggedIn">
          Profile
        </li>
      </ul>
    </header>
    <main>
      <h2>Below is some content from the Drupal backend:</h2>
      <div v-if="isUserLoggedIn">
        <p>
          {{ response }}
        </p>
      </div>
      <div v-else>
        <LoginForm @update-logged-in-status="updateLoggedInStatus" />
      </div>
    </main>
  </div>
</template>
<script>
export default {
  name: 'IndexPage',
  components: {
    LoginForm
  },
  data () {
    return {
      response: 'Loading please wait...',
      isUserLoggedIn: false
    }
  },
  mounted () {
    this.fetchData()
  },
  methods: {
    fetchData () {
      const { DruxtClient } = require('druxt')
      const druxt = new DruxtClient('http://drupal.docker.localhost:8000/')
      if (druxt) {
        console.log('We are on our way. Making changes.')
        druxt.getCollection('node--page').then((collection) => {
          console.log(collection.data[0].attributes.body.value)
          this.response = collection.data[0].attributes.body.value // output the data from the first page node as a test
        })
      }
    },
    updateLoggedInStatus (status) {
      this.isUserLoggedIn = status
    },
    logOut () {
      this.isUserLoggedIn = false
    }
  }
}
</script>
